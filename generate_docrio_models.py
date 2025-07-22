import json
import os
from typing import Dict, List, Any

class ApexGenerator:
    def __init__(self):
        self.types = {}  # Store all encountered types
        self.output_dir = 'force-app/main/default/classes'
        self.schemas = {}
        
    def load_swagger(self, swagger_file: str):
        with open(swagger_file, 'r') as f:
            swagger = json.load(f)
            self.schemas = swagger['components']['schemas']
            
    def register_type(self, type_name: str, schema: dict) -> str:
        """Register a type in our dictionary and return its Apex type name"""
        if type_name in self.types:
            return self.types[type_name]
            
        if isinstance(schema, str):
            # Handle case where schema is just a string reference
            return f"DocrioModels.{schema}"
            
        if schema.get('type') == 'object':
            # This is a complex type that needs an inner class
            apex_type = f"DocrioModels.{type_name}"
            self.types[type_name] = apex_type
            # Process its properties when generating the class
            return apex_type
            
        elif schema.get('type') == 'array' and 'items' in schema:
            # Get the type of the array items
            item_type = self.get_apex_type(schema['items'])
            return f"List<{item_type}>"
            
        elif '$ref' in schema:
            # Reference to another type
            ref_type = schema['$ref'].split('/')[-1]
            # Recursively ensure the referenced type is registered
            if ref_type not in self.types:
                ref_schema = self.schemas.get(ref_type)
                if ref_schema:
                    self.register_type(ref_type, ref_schema)
            return f"DocrioModels.{ref_type}"
            
        # Handle primitive types
        type_map = {
            'string': 'String',
            'integer': 'Integer',
            'boolean': 'Boolean',
            'number': 'Decimal'
        }
        return type_map.get(schema.get('type'), 'Object')

    def get_apex_type(self, schema: dict) -> str:
        """Get the Apex type for a schema, registering new types as needed"""
        if isinstance(schema, str):
            # Handle case where schema is just a string reference
            return f"DocrioModels.{schema}"
            
        if '$ref' in schema:
            ref_type = schema['$ref'].split('/')[-1]
            return self.types.get(ref_type, f"DocrioModels.{ref_type}")
            
        if schema.get('type') == 'object':
            # For anonymous objects, generate a unique name based on properties
            if 'properties' in schema:
                # Create a deterministic name based on property names
                props = sorted(schema['properties'].keys())
                type_name = f"Anonymous{''.join(p.title() for p in props)}"
                if type_name not in self.types:
                    self.register_type(type_name, schema)
                return self.types[type_name]
            return 'Map<String, Object>'
            
        if schema.get('type') == 'array' and 'items' in schema:
            item_type = self.get_apex_type(schema['items'])
            return f"List<{item_type}>"
            
        # Handle primitive types
        type_map = {
            'string': 'String',
            'integer': 'Integer',
            'boolean': 'Boolean',
            'number': 'Decimal'
        }
        return type_map.get(schema.get('type'), 'Object')

    def sanitize_property_name(self, name: str) -> str:
        """Convert property names to valid Apex identifiers"""
        # Replace invalid characters with underscores
        sanitized = name.replace('-', '_').replace('.', '_')
        # If starts with number, prefix with 'n'
        if sanitized[0].isdigit():
            sanitized = 'n' + sanitized
        return sanitized

    def format_description(self, description: str) -> str:
        """Format a description into a proper multi-line comment"""
        if not description:
            return ""
            
        # Split description into lines and trim each line
        lines = [line.strip() for line in description.split('\n')]
        # Remove empty lines at start and end
        while lines and not lines[0]:
            lines.pop(0)
        while lines and not lines[-1]:
            lines.pop()
            
        if not lines:
            return ""
            
        if len(lines) == 1:
            return f"        // {lines[0]}"
            
        # For multi-line comments, use /* */ format
        result = "        /**\n"
        for line in lines:
            result += f"         * {line}\n"
        result += "         */"
        return result

    def generate_inner_class(self, class_name: str, schema: dict) -> str:
        """Generate an inner class definition"""
        if isinstance(schema, str):
            # If schema is just a string reference, look it up
            schema = self.schemas.get(schema, {'type': 'object'})
            
        class_content = f"""
    public class {class_name} {{"""
        
        if 'properties' in schema:
            required = schema.get('required', [])
            for prop_name, prop_schema in schema['properties'].items():
                prop_name = self.sanitize_property_name(prop_name)
                prop_type = self.get_apex_type(prop_schema)
                
                # Add property description if available
                if isinstance(prop_schema, dict) and 'description' in prop_schema:
                    comment = self.format_description(prop_schema['description'])
                    if comment:
                        class_content += f"\n{comment}"
                    
                class_content += f"\n        public {prop_type} {prop_name} {{ get; set; }}"
                
        class_content += "\n    }\n"
        return class_content

    def generate_model_classes(self):
        """Generate all model classes as inner classes"""
        class_content = """/**
 * Generated Docrio API models
 */
public class DocrioModels {
"""
        # First pass: Register all types
        for type_name, schema in self.schemas.items():
            self.register_type(type_name, schema)
            
        # Second pass: Generate inner classes, including anonymous ones
        generated = set()
        
        def generate_class(name, schema):
            if name in generated:
                return ""
            generated.add(name)
            
            # Handle string references
            if isinstance(schema, str):
                schema = self.schemas.get(schema, {'type': 'object'})
            
            # First generate any nested anonymous types
            nested = ""
            if schema.get('type') == 'object' and 'properties' in schema:
                for prop_schema in schema['properties'].values():
                    if isinstance(prop_schema, dict):
                        if prop_schema.get('type') == 'object' and 'properties' in prop_schema:
                            props = sorted(prop_schema['properties'].keys())
                            anon_name = f"Anonymous{''.join(p.title() for p in props)}"
                            if anon_name not in generated:
                                nested += generate_class(anon_name, prop_schema)
                        elif prop_schema.get('type') == 'array' and 'items' in prop_schema:
                            items = prop_schema['items']
                            if isinstance(items, dict) and items.get('type') == 'object' and 'properties' in items:
                                props = sorted(items['properties'].keys())
                                anon_name = f"Anonymous{''.join(p.title() for p in props)}"
                                if anon_name not in generated:
                                    nested += generate_class(anon_name, items)
            
            # Then generate this class
            if schema.get('type') == 'object':
                nested += self.generate_inner_class(name, schema)
            
            return nested
            
        # Generate all classes
        for type_name, schema in self.schemas.items():
            class_content += generate_class(type_name, schema)
                
        class_content += "}\n"
        return class_content

    def generate_service_class(self):
        """Generate the service class with API methods"""
        # Service class generation code here...
        pass

    def write_file(self, filename: str, content: str):
        """Write content to a file in the output directory"""
        os.makedirs(self.output_dir, exist_ok=True)
        filepath = os.path.join(self.output_dir, filename)
        with open(filepath, 'w') as f:
            f.write(content)
        
        # Also write the meta.xml file
        meta_content = """<?xml version="1.0" encoding="UTF-8"?>
<ApexClass xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>57.0</apiVersion>
    <status>Active</status>
</ApexClass>"""
        with open(f"{filepath}-meta.xml", 'w') as f:
            f.write(meta_content)

    def generate(self):
        """Generate all Apex classes"""
        # Generate and write model classes
        models_content = self.generate_model_classes()
        self.write_file('DocrioModels.cls', models_content)

def main():
    generator = ApexGenerator()
    generator.load_swagger('swagger.json')
    generator.generate()

if __name__ == '__main__':
    main() 