import json
import os
import re
from typing import Dict, List, Optional, Set, Tuple

class ServiceGenerator:
    def __init__(self):
        self.output_dir = 'force-app/main/default/classes'
        self.swagger_data = {}
        self.docrio_models: Set[str] = set()  # Set of available model class names
        
    def load_swagger(self, swagger_file: str):
        """Load and parse the swagger.json file"""
        with open(swagger_file, 'r') as f:
            self.swagger_data = json.load(f)
            
    def load_docrio_models(self, models_file: str):
        """Parse DocrioModels.cls to get available model classes"""
        with open(models_file, 'r') as f:
            content = f.read()
            
        # Find all inner class definitions
        class_pattern = r'public\s+class\s+(\w+)\s*{'
        self.docrio_models = set(re.findall(class_pattern, content))
            
    def get_response_type(self, operation: Dict) -> str:
        """Determine the return type for an operation"""
        success_codes = ['200', '201', '202', '204']
        for code in success_codes:
            if code in operation.get('responses', {}):
                response = operation['responses'][code]
                if 'content' in response and 'application/json' in response['content']:
                    schema = response['content']['application/json']['schema']
                    if '$ref' in schema:
                        model_name = schema['$ref'].split('/')[-1]
                        if model_name in self.docrio_models:
                            return f"DocrioModels.{model_name}"
                    elif schema.get('type') == 'array' and 'items' in schema:
                        if '$ref' in schema['items']:
                            model_name = schema['items']['$ref'].split('/')[-1]
                            if model_name in self.docrio_models:
                                return f"List<DocrioModels.{model_name}>"
                return 'Map<String, Object>'  # Default for unrecognized JSON responses
        return 'void'  # No content or no success response defined

    def extract_url_params(self, path: str) -> List[str]:
        """Extract parameter names from URL template, preserving exact names"""
        # Look for {param} patterns and extract the param name exactly as is
        return re.findall(r'{([^}]+)}', path)

    def build_url_string(self, path: str, params: List[str]) -> str:
        """Convert URL template into string concatenation"""
        segments = []
        current = ""
        param_index = 0
        
        for part in re.split(r'({[^}]+})', path):
            if part.startswith('{') and part.endswith('}'):
                if current:
                    segments.append(f"'{current}'")
                    current = ""
                segments.append(params[param_index])
                param_index += 1
            else:
                current += part
                
        if current:
            segments.append(f"'{current}'")
            
        return ' + '.join(segments)

    def generate_endpoint_method(self, endpoint: Dict) -> str:
        """Generate a single endpoint method"""
        operation = endpoint['operation']
        path = endpoint['path']
        http_method = endpoint['method'].upper()
        
        # Generate method name
        parts = [p for p in path.strip('/').split('/') if not p.startswith('{')]
        method_name = f"{http_method.lower()}{''.join(p.capitalize() for p in parts)}"
        
        # Collect parameters
        params = []
        param_docs = []
        param_names = []  # Keep track of actual parameter names for URL building
        
        # Path parameters first - get them from URL template
        path_params = self.extract_url_params(path)
        for param in path_params:
            # Use the exact parameter name from the URL template
            params.append(f"String {param}")
            param_docs.append(f"     * @param {param} Path parameter from URL")
            param_names.append(param)
            
        # Query parameters
        if 'parameters' in operation:
            for param in operation['parameters']:
                if param.get('in') == 'query':
                    param_name = param['name']
                    param_type = 'String'  # Default
                    if 'schema' in param:
                        if param['schema'].get('type') == 'boolean':
                            param_type = 'Boolean'
                        elif param['schema'].get('type') == 'integer':
                            param_type = 'Integer'
                    params.append(f"{param_type} {param_name}")
                    desc = param.get('description', '').replace('\n', ' ').strip()
                    if desc:
                        param_docs.append(f"     * @param {param_name} {desc}")
                        
        # Request body
        request_body = None
        if 'requestBody' in operation:
            content = operation['requestBody']['content']
            if 'application/json' in content:
                schema = content['application/json']['schema']
                if '$ref' in schema:
                    model_name = schema['$ref'].split('/')[-1]
                    if model_name in self.docrio_models:
                        request_body = f"DocrioModels.{model_name}"
                        params.append(f"{request_body} requestBody")
                        desc = operation['requestBody'].get('description', 'The request payload')
                        param_docs.append(f"     * @param requestBody {desc}")
        
        # Generate method documentation
        method_content = "    /**\n"
        if 'summary' in operation:
            method_content += f"     * {operation['summary']}\n"
        if 'description' in operation:
            desc = operation['description'].replace('\n', '\n     * ')
            method_content += f"     * {desc}\n"
        if param_docs:
            method_content += "     *\n" + "\n".join(param_docs) + "\n"
        response_type = self.get_response_type(operation)
        if response_type != 'void':
            method_content += f"     * @return {response_type}\n"
        method_content += "     */\n"
        
        # Generate method signature
        method_content += f"    public static {response_type} {method_name}({', '.join(params)}) {{\n"
        
        # Generate method body
        method_content += "        DocrioClient client = new DocrioClient();\n"
        method_content += f"        Map<String, Object> response = client.doCallout('{http_method}', {self.build_url_string(path, param_names)}, "
        
        # Add request body if present
        if request_body:
            method_content += "requestBody != null ? JSON.serialize(requestBody) : null"
        else:
            method_content += "null"
            
        method_content += ", 'application/json');\n\n"
        
        # Add response handling
        if response_type != 'void':
            method_content += "        if(response != null) {\n"
            method_content += f"            return ({response_type})JSON.deserialize(JSON.serialize(response), {response_type}.class);\n"
            method_content += "        }\n"
            method_content += "        return null;\n"
            
        method_content += "    }\n\n"
        return method_content

    def generate_service_class(self) -> str:
        """Generate the complete service class"""
        paths = self.swagger_data.get('paths', {})
        
        # Start the service class
        class_content = """/**
 * Generated Docrio API service layer
 */
public class DocrioService {
"""
        
        # Group endpoints by tag
        endpoints_by_tag = {}
        for path, methods in paths.items():
            for method, operation in methods.items():
                tags = operation.get('tags', ['Default'])
                for tag in tags:
                    if tag not in endpoints_by_tag:
                        endpoints_by_tag[tag] = []
                    endpoints_by_tag[tag].append({
                        'path': path,
                        'method': method,
                        'operation': operation
                    })
        
        # Generate methods grouped by tag
        for tag, endpoints in sorted(endpoints_by_tag.items()):
            # Add tag as comment
            class_content += f"\n    // {tag} Methods\n"
            
            # Generate each endpoint method
            for endpoint in endpoints:
                class_content += self.generate_endpoint_method(endpoint)
        
        # Close class
        class_content += "}\n"
        return class_content

    def write_file(self, filename: str, content: str):
        """Write content to a file and its meta.xml"""
        os.makedirs(self.output_dir, exist_ok=True)
        filepath = os.path.join(self.output_dir, filename)
        
        with open(filepath, 'w') as f:
            f.write(content)
            
        meta_content = """<?xml version="1.0" encoding="UTF-8"?>
<ApexClass xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>57.0</apiVersion>
    <status>Active</status>
</ApexClass>"""
        
        with open(f"{filepath}-meta.xml", 'w') as f:
            f.write(meta_content)

    def generate(self):
        """Generate the service class"""
        service_content = self.generate_service_class()
        self.write_file('DocrioService.cls', service_content)

def main():
    generator = ServiceGenerator()
    
    # Load both swagger.json and DocrioModels.cls
    generator.load_swagger('swagger.json')
    generator.load_docrio_models('force-app/main/default/classes/DocrioModels.cls')
    
    # Generate service class
    generator.generate()

if __name__ == '__main__':
    main() 