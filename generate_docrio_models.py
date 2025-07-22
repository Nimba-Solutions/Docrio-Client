import json
import os
import re
import string
import random
from typing import Dict, List, Any

class ApexGenerator:
    def __init__(self):
        self.types = {}  # Store all encountered types
        self.output_dir = 'force-app/main/default/classes'
        self.schemas = {}
        
    def sanitize_property_name(self, prop_name: str) -> str:
        """Convert any property name into a valid Apex identifier"""
        # Replace invalid characters with underscores
        sanitized = re.sub(r'[^a-zA-Z0-9_]', '_', prop_name)
        # Ensure it starts with a letter
        if not sanitized[0].isalpha():
            sanitized = 'f' + sanitized
        # Convert to camelCase if it contains underscores
        if '_' in sanitized:
            parts = sanitized.split('_')
            sanitized = parts[0].lower() + ''.join(p.capitalize() for p in parts[1:] if p)
        return sanitized

    def get_apex_friendly_name(self, api_name: str) -> str:
        """Convert API name to Apex-friendly name"""
        # Handle special cases for Salesforce fields
        if '__' in api_name:
            # Split on double underscore
            parts = api_name.split('__')
            # Remove the 'c' suffix if it exists
            if parts[-1] == 'c':
                parts = parts[:-1]
            # Convert each part to camelCase
            result = []
            for part in parts:
                subparts = part.split('_')
                camel = subparts[0].lower()
                for subpart in subparts[1:]:
                    camel += subpart[0].upper() + subpart[1:].lower()
                result.append(camel)
            # Join with first letter capitalized for each part after the first
            return result[0] + ''.join(p[0].upper() + p[1:] for p in result[1:])
        else:
            # Handle non-namespaced fields
            parts = api_name.split('_')
            result = parts[0].lower()
            for part in parts[1:]:
                result += part[0].upper() + part[1:].lower()
            return result

    def is_salesforce_field(self, field_name: str) -> bool:
        """Check if a field name is a Salesforce API name"""
        return '__' in field_name or field_name.endswith('__c')

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

    def get_apex_type(self, schema: dict, parent_class: str = None) -> str:
        """Get the Apex type for a schema, with context-aware anonymous object handling"""
        if isinstance(schema, str):
            # Handle case where schema is just a string reference
            return f"DocrioModels.{schema}"
            
        if '$ref' in schema:
            ref_type = schema['$ref'].split('/')[-1]
            return self.types.get(ref_type, f"DocrioModels.{ref_type}")
            
        if schema.get('type') == 'object':
            # For anonymous objects, return a nested class reference
            if 'properties' in schema:
                # Create a name with Anonymous + 5 random characters
                random_chars = ''.join(random.choices(string.ascii_uppercase + string.digits, k=5))
                type_name = f"Anonymous{random_chars}"
                # If we have a parent class context, return nested reference
                if parent_class:
                    return f"{parent_class}.{type_name}"
                else:
                    # Fallback to global registration (for top-level schemas)
                    while type_name in self.types:
                        random_chars = ''.join(random.choices(string.ascii_uppercase + string.digits, k=5))
                        type_name = f"Anonymous{random_chars}"
                    self.register_type(type_name, schema)
                    return self.types[type_name]
            return 'Map<String, Object>'
            
        if schema.get('type') == 'array' and 'items' in schema:
            item_type = self.get_apex_type(schema['items'], parent_class)
            return f"List<{item_type}>"
            
        # Handle primitive types
        type_map = {
            'string': 'String',
            'integer': 'Integer',
            'boolean': 'Boolean',
            'number': 'Decimal'
        }
        return type_map.get(schema.get('type'), 'Object')

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

    def generate_nested_anonymous_classes(self, schema: dict, parent_class: str, indent_level: int = 2, generated_classes: set = None) -> tuple:
        """Generate nested anonymous classes and return (nested_classes_content, property_type_mappings)"""
        if generated_classes is None:
            generated_classes = set()
            
        nested_content = ""
        type_mappings = {}  # Maps property names to their anonymous class names
        indent = "    " * indent_level
        
        if 'properties' in schema:
            for prop_name, prop_schema in schema['properties'].items():
                # Skip if prop_schema is a string reference (should not happen in inline anonymous objects)
                if not isinstance(prop_schema, dict):
                    continue
                    
                if prop_schema.get('type') == 'object' and 'properties' in prop_schema:
                    # Generate anonymous class name
                    random_chars = ''.join(random.choices(string.ascii_uppercase + string.digits, k=5))
                    anon_class_name = f"Anonymous{random_chars}"
                    
                    # Ensure uniqueness and prevent infinite recursion
                    class_signature = str(sorted(prop_schema['properties'].keys()))
                    if class_signature not in generated_classes:
                        generated_classes.add(class_signature)
                        type_mappings[prop_name] = anon_class_name
                        
                        # Generate the nested class recursively
                        nested_content += self.generate_inner_class(anon_class_name, prop_schema, indent_level, generated_classes)
                        
                elif prop_schema.get('type') == 'array' and 'items' in prop_schema:
                    items = prop_schema['items']
                    if isinstance(items, dict) and items.get('type') == 'object' and 'properties' in items:
                        # Generate anonymous class name for array items
                        random_chars = ''.join(random.choices(string.ascii_uppercase + string.digits, k=5))
                        anon_class_name = f"Anonymous{random_chars}"
                        
                        # Ensure uniqueness and prevent infinite recursion
                        class_signature = str(sorted(items['properties'].keys()))
                        if class_signature not in generated_classes:
                            generated_classes.add(class_signature)
                            type_mappings[f"{prop_name}_items"] = anon_class_name
                            
                            # Generate the nested class recursively
                            nested_content += self.generate_inner_class(anon_class_name, items, indent_level, generated_classes)
                            
        return nested_content, type_mappings

    def generate_inner_class(self, class_name: str, schema: dict, indent_level: int = 1, generated_classes: set = None) -> str:
        """Generate an inner class definition with proper nesting support"""
        if isinstance(schema, str):
            # If schema is just a string reference, look it up
            schema = self.schemas.get(schema, {'type': 'object'})
        
        if generated_classes is None:
            generated_classes = set()
        
        indent = "    " * indent_level
        
        # First, generate all nested anonymous classes
        nested_content, type_mappings = self.generate_nested_anonymous_classes(schema, class_name, indent_level + 1, generated_classes)
        
        # Start class definition
        class_content = f"\n{indent}public class {class_name} {{"
        
        # Add nested anonymous classes first
        class_content += nested_content
        
        # Generate properties
        properties_content = ""
        constructor_content = f"\n{indent}    public {class_name}() {{"
        serialization_content = ""
        deserialization_content = ""
        
        if 'properties' in schema:
            required = schema.get('required', [])
            for prop_name, prop_schema in schema['properties'].items():
                # Sanitize the property name for Apex
                apex_prop_name = self.sanitize_property_name(prop_name)
                
                # Add property description if available
                if isinstance(prop_schema, dict) and 'description' in prop_schema:
                    comment = self.format_description(prop_schema['description'])
                    if comment:
                        properties_content += f"\n{comment.replace('        ', indent + '    ')}"
                
                if self.is_salesforce_field(prop_name):
                    # For Salesforce API fields, create a DocrioField property
                    apex_name = self.get_apex_friendly_name(prop_name)
                    properties_content += f"\n{indent}    public DocrioField {apex_name} {{ get; set; }}"
                    constructor_content += f"\n{indent}        this.{apex_name} = new DocrioField('{prop_name}');"
                    # Add to serialization content
                    serialization_content += f"\n{indent}        if({apex_name} != null) jsonMap.put('{prop_name}', {apex_name}.toJson());"
                    # Add to deserialization content
                    deserialization_content += f"""
{indent}        if(jsonMap.containsKey('{prop_name}')) {{
{indent}            obj.{apex_name}.setValue((String)jsonMap.get('{prop_name}'));
{indent}        }}"""
                else:
                    # Determine property type
                    if prop_name in type_mappings:
                        # This property has an anonymous nested class
                        prop_type = type_mappings[prop_name]
                    elif isinstance(prop_schema, dict) and prop_schema.get('type') == 'array' and f"{prop_name}_items" in type_mappings:
                        # This is an array with anonymous item type
                        item_type = type_mappings[f"{prop_name}_items"]
                        prop_type = f"List<{item_type}>"
                    else:
                        # Use regular type resolution
                        prop_type = self.get_apex_type(prop_schema, class_name)
                        
                    properties_content += f"\n{indent}    public {prop_type} {apex_prop_name} {{ get; set; }}"
                    # Add to serialization content
                    serialization_content += f"\n{indent}        if({apex_prop_name} != null) jsonMap.put('{prop_name}', {apex_prop_name});"
                    # Add to deserialization content
                    deserialization_content += f"""
{indent}        if(jsonMap.containsKey('{prop_name}')) {{
{indent}            obj.{apex_prop_name} = ({prop_type})jsonMap.get('{prop_name}');
{indent}        }}"""
        
        # Add properties to class
        class_content += properties_content
        
        # Add constructor
        constructor_content += f"\n{indent}    }}"
        class_content += constructor_content
        
        # Add serialization method
        class_content += f"""

{indent}    public Map<String, Object> toJson() {{
{indent}        Map<String, Object> jsonMap = new Map<String, Object>();"""
        class_content += serialization_content
        class_content += f"""
{indent}        return jsonMap;
{indent}    }}"""
        
        # Add deserialization method
        class_content += f"""

{indent}    public static {class_name} fromJson(Map<String, Object> jsonMap) {{
{indent}        {class_name} obj = new {class_name}();"""
        class_content += deserialization_content
        class_content += f"""
{indent}        return obj;
{indent}    }}"""
                
        # Close class
        class_content += f"\n{indent}}}"
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
            
        # Second pass: Generate inner classes (top-level schemas only - no anonymous flattening)
        for type_name, schema in self.schemas.items():
            if schema.get('type') == 'object':
                class_content += self.generate_inner_class(type_name, schema)
                
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