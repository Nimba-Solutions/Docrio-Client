import json
import os
from typing import Dict, List, Any

class ApexClassGenerator:
    def __init__(self, swagger_file: str):
        with open(swagger_file, 'r') as f:
            self.swagger_data = json.load(f)
        
        self.output_dir = 'force-app/main/default/classes'
        os.makedirs(self.output_dir, exist_ok=True)
        
        # Mapping of OpenAPI types to Apex types
        self.type_mapping = {
            'string': 'String',
            'integer': 'Integer',
            'number': 'Decimal',
            'boolean': 'Boolean',
            'array': 'List<Object>',  # Will be refined based on items
            'object': 'Map<String, Object>'
        }

    def generate_model_classes(self):
        """Generate Apex model classes from schema definitions"""
        schemas = self.swagger_data.get('components', {}).get('schemas', {})
        
        # Start the outer class
        class_content = """public class DocrioModels {
    // Inner classes for all models
"""
        
        # Generate each schema as an inner class
        for class_name, schema in schemas.items():
            if schema.get('type') == 'object':
                class_content += self.generate_model_class(class_name, schema)
        
        # Close the outer class
        class_content += "}\n"
        
        # Write to file
        file_path = os.path.join(self.output_dir, "DocrioModels.cls")
        with open(file_path, 'w') as f:
            f.write(class_content)
        
        # Create meta XML file
        meta_content = """<?xml version="1.0" encoding="UTF-8"?>
<ApexClass xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>57.0</apiVersion>
    <status>Active</status>
</ApexClass>"""
        
        with open(f"{file_path}-meta.xml", 'w') as f:
            f.write(meta_content)

    def sanitize_property_name(self, name: str) -> str:
        """Convert potentially invalid property names to valid Apex identifiers"""
        # Replace hyphens and dots with underscores
        sanitized = name.replace('-', '_').replace('.', '_')
        # If it starts with a number, prefix with 'n'
        if sanitized[0].isdigit():
            sanitized = 'n' + sanitized
        return sanitized

    def generate_model_class(self, class_name: str, schema: Dict):
        """Generate a single model class"""
        properties = schema.get('properties', {})
        required = schema.get('required', [])
        
        class_content = f"""public class {class_name} {{
    // Properties
"""
        
        # Generate properties
        for prop_name, prop_schema in properties.items():
            apex_type = self.get_apex_type(prop_schema)
            sanitized_name = self.sanitize_property_name(prop_name)
            is_required = prop_name in required
            
            # Add property
            class_content += f"    public {apex_type} {sanitized_name} {{ get; set; }}\n\n"
        
        # Add constructor
        class_content += f"""    public {class_name}() {{
        // Default constructor
    }}
"""

        # Close class
        class_content += "}\n"
        
        return class_content

    def generate_api_classes(self):
        """Generate Apex API integration classes"""
        paths = self.swagger_data.get('paths', {})
        
        # Start the outer service class
        class_content = """public class DocrioService {
    private static final String BASE_URL = '/services/data/v57.0/docrio';  // Update with correct base URL
    
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
        
        # Generate a service inner class for each tag
        for tag, endpoints in endpoints_by_tag.items():
            class_content += self.generate_service_class(tag, endpoints)
        
        # Close the outer class
        class_content += "}\n"
        
        # Write to file
        file_path = os.path.join(self.output_dir, "DocrioService.cls")
        with open(file_path, 'w') as f:
            f.write(class_content)
        
        # Create meta XML file
        meta_content = """<?xml version="1.0" encoding="UTF-8"?>
<ApexClass xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>57.0</apiVersion>
    <status>Active</status>
</ApexClass>"""
        
        with open(f"{file_path}-meta.xml", 'w') as f:
            f.write(meta_content)

    def generate_service_class(self, tag: str, endpoints: List[Dict]) -> str:
        """Generate a service inner class for a group of endpoints"""
        class_name = f"{tag.replace(' ', '')}Service"
        
        class_content = f"""    public class {class_name} {{
        
"""
        
        # Generate methods for each endpoint
        for endpoint in endpoints:
            method_content = self.generate_endpoint_method(endpoint)
            class_content += method_content
        
        # Close inner class
        class_content += "    }\n\n"
        
        return class_content

    def generate_endpoint_method(self, endpoint: Dict) -> str:
        """Generate an Apex method for an API endpoint"""
        operation = endpoint['operation']
        method_name = self.get_method_name(endpoint['path'], endpoint['method'])
        
        # Get parameters
        params = []
        query_params = []
        if 'parameters' in operation:
            for param in operation['parameters']:
                param_type = self.get_apex_type(param.get('schema', {}))
                param_name = param.get('name', '').replace('-', '_')
                params.append(f"{param_type} {param_name}")
                if param.get('in') == 'query':
                    query_params.append(param_name)

        # Get request body if present
        if 'requestBody' in operation:
            schema = operation['requestBody']['content']['application/json']['schema']
            if '$ref' in schema:
                ref_type = schema['$ref'].split('/')[-1]
                params.append(f"DocrioModels.{ref_type} requestBody")
        
        # Get response type
        response_type = 'void'
        success_codes = ['200', '201', '202', '204']
        for code in success_codes:
            if code in operation.get('responses', {}):
                response_content = operation['responses'][code].get('content', {})
                if 'application/json' in response_content:
                    response_schema = response_content['application/json'].get('schema', {})
                    response_type = self.get_apex_type(response_schema)
                break
        
        # Build the method
        method_content = f"""    public static {response_type} {method_name}({', '.join(params)}) {{
        // Build endpoint with query parameters
        String endpoint = '{endpoint['path']}';\n"""

        # Add query parameters if any
        if query_params:
            method_content += "        List<String> queryParams = new List<String>();\n"
            for param in query_params:
                method_content += f"""        if({param} != null) {{
            queryParams.add('{param}=' + EncodingUtil.urlEncode(String.valueOf({param}), 'UTF-8'));
        }}\n"""
            method_content += """        if(!queryParams.isEmpty()) {
            endpoint += '?' + String.join(queryParams, '&');
        }\n"""

        # Add request body handling
        if 'requestBody' in operation:
            method_content += """
        // Prepare request body
        String body = JSON.serialize(requestBody);\n"""
        else:
            method_content += "\n        String body = null;\n"

        # Make the callout using DocrioClient
        method_content += """
        // Make API call using DocrioClient
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('{method}', endpoint, body, 'application/json');
        
        // Parse response
        if(response != null) {{
            return ({response_type})JSON.deserialize(JSON.serialize(response), {response_type}.class);
        }}
        return null;
    }}
    
""".format(method=endpoint['method'].upper(), response_type=response_type)

        return method_content

    def get_apex_type(self, schema: Dict) -> str:
        """Convert OpenAPI type to Apex type"""
        if '$ref' in schema:
            return schema['$ref'].split('/')[-1]
        
        schema_type = schema.get('type', 'object')
        
        if schema_type == 'array':
            item_type = self.get_apex_type(schema.get('items', {}))
            return f"List<{item_type}>"
        
        return self.type_mapping.get(schema_type, 'Object')

    def get_method_name(self, path: str, method: str) -> str:
        """Generate a method name from the path and HTTP method"""
        # Remove leading/trailing slashes and split path
        parts = [p for p in path.strip('/').split('/') if not p.startswith('{')]
        
        # Capitalize parts and combine
        parts = [p.capitalize() for p in parts]
        return f"{method.lower()}{''.join(parts)}"

def main():
    generator = ApexClassGenerator('swagger.json')
    generator.generate_model_classes()
    generator.generate_api_classes()

if __name__ == '__main__':
    main() 