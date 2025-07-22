/**
 * Generated Docrio API models
 */
public class DocrioModels {

    public class SearchPostRequest {
        public class AnonymousFPJN3 {
            public String StartValue { get; set; }
            public String EndValue { get; set; }
            public AnonymousFPJN3() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(StartValue != null) jsonMap.put('StartValue', StartValue);
                if(EndValue != null) jsonMap.put('EndValue', EndValue);
                return jsonMap;
            }

            public static AnonymousFPJN3 fromJson(Map<String, Object> jsonMap) {
                AnonymousFPJN3 obj = new AnonymousFPJN3();
                if(jsonMap.containsKey('StartValue')) {
                    obj.StartValue = (String)jsonMap.get('StartValue');
                }
                if(jsonMap.containsKey('EndValue')) {
                    obj.EndValue = (String)jsonMap.get('EndValue');
                }
                return obj;
            }
        }
        public class AnonymousRG5KS {
            public String offsetSortValue { get; set; }
            public String offsetSortId { get; set; }
            public AnonymousRG5KS() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(offsetSortValue != null) jsonMap.put('offsetSortValue', offsetSortValue);
                if(offsetSortId != null) jsonMap.put('offsetSortId', offsetSortId);
                return jsonMap;
            }

            public static AnonymousRG5KS fromJson(Map<String, Object> jsonMap) {
                AnonymousRG5KS obj = new AnonymousRG5KS();
                if(jsonMap.containsKey('offsetSortValue')) {
                    obj.offsetSortValue = (String)jsonMap.get('offsetSortValue');
                }
                if(jsonMap.containsKey('offsetSortId')) {
                    obj.offsetSortId = (String)jsonMap.get('offsetSortId');
                }
                return obj;
            }
        }
        public class AnonymousO4Y58 {
            public String sortField { get; set; }
            public String sortDirection { get; set; }
            public AnonymousO4Y58() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(sortField != null) jsonMap.put('sortField', sortField);
                if(sortDirection != null) jsonMap.put('sortDirection', sortDirection);
                return jsonMap;
            }

            public static AnonymousO4Y58 fromJson(Map<String, Object> jsonMap) {
                AnonymousO4Y58 obj = new AnonymousO4Y58();
                if(jsonMap.containsKey('sortField')) {
                    obj.sortField = (String)jsonMap.get('sortField');
                }
                if(jsonMap.containsKey('sortDirection')) {
                    obj.sortDirection = (String)jsonMap.get('sortDirection');
                }
                return obj;
            }
        }
        public String Name { get; set; }
        public AnonymousFPJN3 CreatedDate { get; set; }
        public String Author { get; set; }
        public DocrioField litifyDocsRelatedTo { get; set; }
        public DocrioField customField { get; set; }
        public String IsArchived { get; set; }
        public AnonymousRG5KS paginationState { get; set; }
        public String paginationToken { get; set; }
        public AnonymousO4Y58 sortState { get; set; }
        public SearchPostRequest() {
            this.litifyDocsRelatedTo = new DocrioField('litify_docs__Related_To__c');
            this.customField = new DocrioField('Custom_Field__c');
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Name != null) jsonMap.put('Name', Name);
            if(CreatedDate != null) jsonMap.put('CreatedDate', CreatedDate);
            if(Author != null) jsonMap.put('Author', Author);
            if(litifyDocsRelatedTo != null) jsonMap.put('litify_docs__Related_To__c', litifyDocsRelatedTo.toJson());
            if(customField != null) jsonMap.put('Custom_Field__c', customField.toJson());
            if(IsArchived != null) jsonMap.put('IsArchived', IsArchived);
            if(paginationState != null) jsonMap.put('paginationState', paginationState);
            if(paginationToken != null) jsonMap.put('paginationToken', paginationToken);
            if(sortState != null) jsonMap.put('sortState', sortState);
            return jsonMap;
        }

        public static SearchPostRequest fromJson(Map<String, Object> jsonMap) {
            SearchPostRequest obj = new SearchPostRequest();
            if(jsonMap.containsKey('Name')) {
                obj.Name = (String)jsonMap.get('Name');
            }
            if(jsonMap.containsKey('CreatedDate')) {
                obj.CreatedDate = (AnonymousFPJN3)jsonMap.get('CreatedDate');
            }
            if(jsonMap.containsKey('Author')) {
                obj.Author = (String)jsonMap.get('Author');
            }
            if(jsonMap.containsKey('litify_docs__Related_To__c')) {
                obj.litifyDocsRelatedTo.setValue((String)jsonMap.get('litify_docs__Related_To__c'));
            }
            if(jsonMap.containsKey('Custom_Field__c')) {
                obj.customField.setValue((String)jsonMap.get('Custom_Field__c'));
            }
            if(jsonMap.containsKey('IsArchived')) {
                obj.IsArchived = (String)jsonMap.get('IsArchived');
            }
            if(jsonMap.containsKey('paginationState')) {
                obj.paginationState = (AnonymousRG5KS)jsonMap.get('paginationState');
            }
            if(jsonMap.containsKey('paginationToken')) {
                obj.paginationToken = (String)jsonMap.get('paginationToken');
            }
            if(jsonMap.containsKey('sortState')) {
                obj.sortState = (AnonymousO4Y58)jsonMap.get('sortState');
            }
            return obj;
        }
    }
    public class SearchPostResponse {
        public class Anonymous8UTLT {
            public String offsetSortValue { get; set; }
            public String offsetSortId { get; set; }
            public Anonymous8UTLT() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(offsetSortValue != null) jsonMap.put('offsetSortValue', offsetSortValue);
                if(offsetSortId != null) jsonMap.put('offsetSortId', offsetSortId);
                return jsonMap;
            }

            public static Anonymous8UTLT fromJson(Map<String, Object> jsonMap) {
                Anonymous8UTLT obj = new Anonymous8UTLT();
                if(jsonMap.containsKey('offsetSortValue')) {
                    obj.offsetSortValue = (String)jsonMap.get('offsetSortValue');
                }
                if(jsonMap.containsKey('offsetSortId')) {
                    obj.offsetSortId = (String)jsonMap.get('offsetSortId');
                }
                return obj;
            }
        }
        public List<DocrioModels.FileRecordObject> Records { get; set; }
        public Anonymous8UTLT paginationState { get; set; }
        public String paginationToken { get; set; }
        public SearchPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Records != null) jsonMap.put('Records', Records);
            if(paginationState != null) jsonMap.put('paginationState', paginationState);
            if(paginationToken != null) jsonMap.put('paginationToken', paginationToken);
            return jsonMap;
        }

        public static SearchPostResponse fromJson(Map<String, Object> jsonMap) {
            SearchPostResponse obj = new SearchPostResponse();
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<DocrioModels.FileRecordObject>)jsonMap.get('Records');
            }
            if(jsonMap.containsKey('paginationState')) {
                obj.paginationState = (Anonymous8UTLT)jsonMap.get('paginationState');
            }
            if(jsonMap.containsKey('paginationToken')) {
                obj.paginationToken = (String)jsonMap.get('paginationToken');
            }
            return obj;
        }
    }
    public class MovePostRequest {
        public List<String> Ids { get; set; }
        public String RelatedRecordId { get; set; }
        public MovePostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Ids != null) jsonMap.put('Ids', Ids);
            if(RelatedRecordId != null) jsonMap.put('RelatedRecordId', RelatedRecordId);
            return jsonMap;
        }

        public static MovePostRequest fromJson(Map<String, Object> jsonMap) {
            MovePostRequest obj = new MovePostRequest();
            if(jsonMap.containsKey('Ids')) {
                obj.Ids = (List<String>)jsonMap.get('Ids');
            }
            if(jsonMap.containsKey('RelatedRecordId')) {
                obj.RelatedRecordId = (String)jsonMap.get('RelatedRecordId');
            }
            return obj;
        }
    }
    public class MovePostResponse {
        public List<String> Failures { get; set; }
        public MovePostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Failures != null) jsonMap.put('Failures', Failures);
            return jsonMap;
        }

        public static MovePostResponse fromJson(Map<String, Object> jsonMap) {
            MovePostResponse obj = new MovePostResponse();
            if(jsonMap.containsKey('Failures')) {
                obj.Failures = (List<String>)jsonMap.get('Failures');
            }
            return obj;
        }
    }
    public class MergePostRequest {
        public class AnonymousDVGAH {
            /**
             * Only used for PDF Templates.
             * If true, the template will be flattened. This means that the template will be merged into the file as a single layer, and the resulting file will not be editable.
             * If false, the template will be merged into the file as a layer, and the resulting file will be editable.
             */
            public Boolean Flatten { get; set; }
            public String SourceId { get; set; }
            public Map<String, Object> Tags { get; set; }
            public DocrioField litifyDocsRelatedTo { get; set; }
            public DocrioField litifyDocsFolderPath { get; set; }
            public DocrioField litifyDocsFileType { get; set; }
            public String Name { get; set; }
            public AnonymousDVGAH() {
                this.litifyDocsRelatedTo = new DocrioField('litify_docs__Related_To__c');
                this.litifyDocsFolderPath = new DocrioField('litify_docs__Folder_Path__c');
                this.litifyDocsFileType = new DocrioField('litify_docs__File_Type__c');
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(Flatten != null) jsonMap.put('Flatten', Flatten);
                if(SourceId != null) jsonMap.put('SourceId', SourceId);
                if(Tags != null) jsonMap.put('Tags', Tags);
                if(litifyDocsRelatedTo != null) jsonMap.put('litify_docs__Related_To__c', litifyDocsRelatedTo.toJson());
                if(litifyDocsFolderPath != null) jsonMap.put('litify_docs__Folder_Path__c', litifyDocsFolderPath.toJson());
                if(litifyDocsFileType != null) jsonMap.put('litify_docs__File_Type__c', litifyDocsFileType.toJson());
                if(Name != null) jsonMap.put('Name', Name);
                return jsonMap;
            }

            public static AnonymousDVGAH fromJson(Map<String, Object> jsonMap) {
                AnonymousDVGAH obj = new AnonymousDVGAH();
                if(jsonMap.containsKey('Flatten')) {
                    obj.Flatten = (Boolean)jsonMap.get('Flatten');
                }
                if(jsonMap.containsKey('SourceId')) {
                    obj.SourceId = (String)jsonMap.get('SourceId');
                }
                if(jsonMap.containsKey('Tags')) {
                    obj.Tags = (Map<String, Object>)jsonMap.get('Tags');
                }
                if(jsonMap.containsKey('litify_docs__Related_To__c')) {
                    obj.litifyDocsRelatedTo.setValue((String)jsonMap.get('litify_docs__Related_To__c'));
                }
                if(jsonMap.containsKey('litify_docs__Folder_Path__c')) {
                    obj.litifyDocsFolderPath.setValue((String)jsonMap.get('litify_docs__Folder_Path__c'));
                }
                if(jsonMap.containsKey('litify_docs__File_Type__c')) {
                    obj.litifyDocsFileType.setValue((String)jsonMap.get('litify_docs__File_Type__c'));
                }
                if(jsonMap.containsKey('Name')) {
                    obj.Name = (String)jsonMap.get('Name');
                }
                return obj;
            }
        }
        public List<AnonymousDVGAH> Templates { get; set; }
        public MergePostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Templates != null) jsonMap.put('Templates', Templates);
            return jsonMap;
        }

        public static MergePostRequest fromJson(Map<String, Object> jsonMap) {
            MergePostRequest obj = new MergePostRequest();
            if(jsonMap.containsKey('Templates')) {
                obj.Templates = (List<AnonymousDVGAH>)jsonMap.get('Templates');
            }
            return obj;
        }
    }
    public class MergePostResponse {
        public class AnonymousR8K8I {
            public String Id { get; set; }
            public DocrioField litifyDocsRelatedTo { get; set; }
            public DocrioField litifyDocsFolderPath { get; set; }
            public DocrioField litifyDocsFileType { get; set; }
            public DocrioField litifyDocsMergeId { get; set; }
            public String Name { get; set; }
            public AnonymousR8K8I() {
                this.litifyDocsRelatedTo = new DocrioField('litify_docs__Related_To__c');
                this.litifyDocsFolderPath = new DocrioField('litify_docs__Folder_Path__c');
                this.litifyDocsFileType = new DocrioField('litify_docs__File_Type__c');
                this.litifyDocsMergeId = new DocrioField('litify_docs__Merge_Id__c');
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(Id != null) jsonMap.put('Id', Id);
                if(litifyDocsRelatedTo != null) jsonMap.put('litify_docs__Related_To__c', litifyDocsRelatedTo.toJson());
                if(litifyDocsFolderPath != null) jsonMap.put('litify_docs__Folder_Path__c', litifyDocsFolderPath.toJson());
                if(litifyDocsFileType != null) jsonMap.put('litify_docs__File_Type__c', litifyDocsFileType.toJson());
                if(litifyDocsMergeId != null) jsonMap.put('litify_docs__Merge_Id__c', litifyDocsMergeId.toJson());
                if(Name != null) jsonMap.put('Name', Name);
                return jsonMap;
            }

            public static AnonymousR8K8I fromJson(Map<String, Object> jsonMap) {
                AnonymousR8K8I obj = new AnonymousR8K8I();
                if(jsonMap.containsKey('Id')) {
                    obj.Id = (String)jsonMap.get('Id');
                }
                if(jsonMap.containsKey('litify_docs__Related_To__c')) {
                    obj.litifyDocsRelatedTo.setValue((String)jsonMap.get('litify_docs__Related_To__c'));
                }
                if(jsonMap.containsKey('litify_docs__Folder_Path__c')) {
                    obj.litifyDocsFolderPath.setValue((String)jsonMap.get('litify_docs__Folder_Path__c'));
                }
                if(jsonMap.containsKey('litify_docs__File_Type__c')) {
                    obj.litifyDocsFileType.setValue((String)jsonMap.get('litify_docs__File_Type__c'));
                }
                if(jsonMap.containsKey('litify_docs__Merge_Id__c')) {
                    obj.litifyDocsMergeId.setValue((String)jsonMap.get('litify_docs__Merge_Id__c'));
                }
                if(jsonMap.containsKey('Name')) {
                    obj.Name = (String)jsonMap.get('Name');
                }
                return obj;
            }
        }
        public List<AnonymousR8K8I> Records { get; set; }
        public MergePostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Records != null) jsonMap.put('Records', Records);
            return jsonMap;
        }

        public static MergePostResponse fromJson(Map<String, Object> jsonMap) {
            MergePostResponse obj = new MergePostResponse();
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<AnonymousR8K8I>)jsonMap.get('Records');
            }
            return obj;
        }
    }
    public class MergeGetResponse {
        public class AnonymousQ243E {
            public String SourceId { get; set; }
            public DocrioField litifyDocsOriginMergeTemplate { get; set; }
            public DocrioField litifyDocsRelatedTo { get; set; }
            public DocrioField litifyDocsBulkMergeJob { get; set; }
            public DocrioField litifyDocsFolderPath { get; set; }
            public DocrioField litifyDocsFileType { get; set; }
            public String Name { get; set; }
            public Map<String, Object> Tags { get; set; }
            public AnonymousQ243E() {
                this.litifyDocsOriginMergeTemplate = new DocrioField('litify_docs__Origin_Merge_Template__c');
                this.litifyDocsRelatedTo = new DocrioField('litify_docs__Related_To__c');
                this.litifyDocsBulkMergeJob = new DocrioField('litify_docs__Bulk_Merge_Job__c');
                this.litifyDocsFolderPath = new DocrioField('litify_docs__Folder_Path__c');
                this.litifyDocsFileType = new DocrioField('litify_docs__File_Type__c');
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(SourceId != null) jsonMap.put('SourceId', SourceId);
                if(litifyDocsOriginMergeTemplate != null) jsonMap.put('litify_docs__Origin_Merge_Template__c', litifyDocsOriginMergeTemplate.toJson());
                if(litifyDocsRelatedTo != null) jsonMap.put('litify_docs__Related_To__c', litifyDocsRelatedTo.toJson());
                if(litifyDocsBulkMergeJob != null) jsonMap.put('litify_docs__Bulk_Merge_Job__c', litifyDocsBulkMergeJob.toJson());
                if(litifyDocsFolderPath != null) jsonMap.put('litify_docs__Folder_Path__c', litifyDocsFolderPath.toJson());
                if(litifyDocsFileType != null) jsonMap.put('litify_docs__File_Type__c', litifyDocsFileType.toJson());
                if(Name != null) jsonMap.put('Name', Name);
                if(Tags != null) jsonMap.put('Tags', Tags);
                return jsonMap;
            }

            public static AnonymousQ243E fromJson(Map<String, Object> jsonMap) {
                AnonymousQ243E obj = new AnonymousQ243E();
                if(jsonMap.containsKey('SourceId')) {
                    obj.SourceId = (String)jsonMap.get('SourceId');
                }
                if(jsonMap.containsKey('litify_docs__Origin_Merge_Template__c')) {
                    obj.litifyDocsOriginMergeTemplate.setValue((String)jsonMap.get('litify_docs__Origin_Merge_Template__c'));
                }
                if(jsonMap.containsKey('litify_docs__Related_To__c')) {
                    obj.litifyDocsRelatedTo.setValue((String)jsonMap.get('litify_docs__Related_To__c'));
                }
                if(jsonMap.containsKey('litify_docs__Bulk_Merge_Job__c')) {
                    obj.litifyDocsBulkMergeJob.setValue((String)jsonMap.get('litify_docs__Bulk_Merge_Job__c'));
                }
                if(jsonMap.containsKey('litify_docs__Folder_Path__c')) {
                    obj.litifyDocsFolderPath.setValue((String)jsonMap.get('litify_docs__Folder_Path__c'));
                }
                if(jsonMap.containsKey('litify_docs__File_Type__c')) {
                    obj.litifyDocsFileType.setValue((String)jsonMap.get('litify_docs__File_Type__c'));
                }
                if(jsonMap.containsKey('Name')) {
                    obj.Name = (String)jsonMap.get('Name');
                }
                if(jsonMap.containsKey('Tags')) {
                    obj.Tags = (Map<String, Object>)jsonMap.get('Tags');
                }
                return obj;
            }
        }
        public List<AnonymousQ243E> Templates { get; set; }
        public MergeGetResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Templates != null) jsonMap.put('Templates', Templates);
            return jsonMap;
        }

        public static MergeGetResponse fromJson(Map<String, Object> jsonMap) {
            MergeGetResponse obj = new MergeGetResponse();
            if(jsonMap.containsKey('Templates')) {
                obj.Templates = (List<AnonymousQ243E>)jsonMap.get('Templates');
            }
            return obj;
        }
    }
    public class MergeCompletePostRequest {
        public List<String> Ids { get; set; }
        public MergeCompletePostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Ids != null) jsonMap.put('Ids', Ids);
            return jsonMap;
        }

        public static MergeCompletePostRequest fromJson(Map<String, Object> jsonMap) {
            MergeCompletePostRequest obj = new MergeCompletePostRequest();
            if(jsonMap.containsKey('Ids')) {
                obj.Ids = (List<String>)jsonMap.get('Ids');
            }
            return obj;
        }
    }
    public class MergeCompletePostResponse {
        public Map<String, Object> Statuses { get; set; }
        public MergeCompletePostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Statuses != null) jsonMap.put('Statuses', Statuses);
            return jsonMap;
        }

        public static MergeCompletePostResponse fromJson(Map<String, Object> jsonMap) {
            MergeCompletePostResponse obj = new MergeCompletePostResponse();
            if(jsonMap.containsKey('Statuses')) {
                obj.Statuses = (Map<String, Object>)jsonMap.get('Statuses');
            }
            return obj;
        }
    }
    public class MergeSchemaGetResponse {
        public class AnonymousV2JYO {
            public class Anonymous2FBHH {
                public class AnonymousFT7ZI {
                    public String const { get; set; }
                    public String description { get; set; }
                    public String type { get; set; }
                    public AnonymousFT7ZI() {
                    }

                    public Map<String, Object> toJson() {
                        Map<String, Object> jsonMap = new Map<String, Object>();
                        if(const != null) jsonMap.put('const', const);
                        if(description != null) jsonMap.put('description', description);
                        if(type != null) jsonMap.put('type', type);
                        return jsonMap;
                    }

                    public static AnonymousFT7ZI fromJson(Map<String, Object> jsonMap) {
                        AnonymousFT7ZI obj = new AnonymousFT7ZI();
                        if(jsonMap.containsKey('const')) {
                            obj.const = (String)jsonMap.get('const');
                        }
                        if(jsonMap.containsKey('description')) {
                            obj.description = (String)jsonMap.get('description');
                        }
                        if(jsonMap.containsKey('type')) {
                            obj.type = (String)jsonMap.get('type');
                        }
                        return obj;
                    }
                }
                public class AnonymousB9L5O {
                    public class Anonymous27I2R {
                        public DocrioModels.object type { get; set; }
                        public Map<String, Object> example { get; set; }
                        public Anonymous27I2R() {
                        }

                        public Map<String, Object> toJson() {
                            Map<String, Object> jsonMap = new Map<String, Object>();
                            if(type != null) jsonMap.put('type', type);
                            if(example != null) jsonMap.put('example', example);
                            return jsonMap;
                        }

                        public static Anonymous27I2R fromJson(Map<String, Object> jsonMap) {
                            Anonymous27I2R obj = new Anonymous27I2R();
                            if(jsonMap.containsKey('type')) {
                                obj.type = (DocrioModels.object)jsonMap.get('type');
                            }
                            if(jsonMap.containsKey('example')) {
                                obj.example = (Map<String, Object>)jsonMap.get('example');
                            }
                            return obj;
                        }
                    }
                    public String type { get; set; }
                    public List<String> required { get; set; }
                    public Anonymous27I2R properties { get; set; }
                    public AnonymousB9L5O() {
                    }

                    public Map<String, Object> toJson() {
                        Map<String, Object> jsonMap = new Map<String, Object>();
                        if(type != null) jsonMap.put('type', type);
                        if(required != null) jsonMap.put('required', required);
                        if(properties != null) jsonMap.put('properties', properties);
                        return jsonMap;
                    }

                    public static AnonymousB9L5O fromJson(Map<String, Object> jsonMap) {
                        AnonymousB9L5O obj = new AnonymousB9L5O();
                        if(jsonMap.containsKey('type')) {
                            obj.type = (String)jsonMap.get('type');
                        }
                        if(jsonMap.containsKey('required')) {
                            obj.required = (List<String>)jsonMap.get('required');
                        }
                        if(jsonMap.containsKey('properties')) {
                            obj.properties = (Anonymous27I2R)jsonMap.get('properties');
                        }
                        return obj;
                    }
                }
                public DocrioModels.object type { get; set; }
                public AnonymousFT7ZI SourceId { get; set; }
                public AnonymousB9L5O Tags { get; set; }
                public Anonymous2FBHH() {
                }

                public Map<String, Object> toJson() {
                    Map<String, Object> jsonMap = new Map<String, Object>();
                    if(type != null) jsonMap.put('type', type);
                    if(SourceId != null) jsonMap.put('SourceId', SourceId);
                    if(Tags != null) jsonMap.put('Tags', Tags);
                    return jsonMap;
                }

                public static Anonymous2FBHH fromJson(Map<String, Object> jsonMap) {
                    Anonymous2FBHH obj = new Anonymous2FBHH();
                    if(jsonMap.containsKey('type')) {
                        obj.type = (DocrioModels.object)jsonMap.get('type');
                    }
                    if(jsonMap.containsKey('SourceId')) {
                        obj.SourceId = (AnonymousFT7ZI)jsonMap.get('SourceId');
                    }
                    if(jsonMap.containsKey('Tags')) {
                        obj.Tags = (AnonymousB9L5O)jsonMap.get('Tags');
                    }
                    return obj;
                }
            }
            public DocrioModels.object type { get; set; }
            public List<Anonymous2FBHH> Templates { get; set; }
            public AnonymousV2JYO() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(type != null) jsonMap.put('type', type);
                if(Templates != null) jsonMap.put('Templates', Templates);
                return jsonMap;
            }

            public static AnonymousV2JYO fromJson(Map<String, Object> jsonMap) {
                AnonymousV2JYO obj = new AnonymousV2JYO();
                if(jsonMap.containsKey('type')) {
                    obj.type = (DocrioModels.object)jsonMap.get('type');
                }
                if(jsonMap.containsKey('Templates')) {
                    obj.Templates = (List<Anonymous2FBHH>)jsonMap.get('Templates');
                }
                return obj;
            }
        }
        public String fSchema { get; set; }
        public String type { get; set; }
        public AnonymousV2JYO properties { get; set; }
        public MergeSchemaGetResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(fSchema != null) jsonMap.put('$schema', fSchema);
            if(type != null) jsonMap.put('type', type);
            if(properties != null) jsonMap.put('properties', properties);
            return jsonMap;
        }

        public static MergeSchemaGetResponse fromJson(Map<String, Object> jsonMap) {
            MergeSchemaGetResponse obj = new MergeSchemaGetResponse();
            if(jsonMap.containsKey('$schema')) {
                obj.fSchema = (String)jsonMap.get('$schema');
            }
            if(jsonMap.containsKey('type')) {
                obj.type = (String)jsonMap.get('type');
            }
            if(jsonMap.containsKey('properties')) {
                obj.properties = (AnonymousV2JYO)jsonMap.get('properties');
            }
            return obj;
        }
    }
    public class CopyPostRequest {
        public class AnonymousEAVZG {
            public String Id { get; set; }
            public String Name { get; set; }
            public AnonymousEAVZG() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(Id != null) jsonMap.put('Id', Id);
                if(Name != null) jsonMap.put('Name', Name);
                return jsonMap;
            }

            public static AnonymousEAVZG fromJson(Map<String, Object> jsonMap) {
                AnonymousEAVZG obj = new AnonymousEAVZG();
                if(jsonMap.containsKey('Id')) {
                    obj.Id = (String)jsonMap.get('Id');
                }
                if(jsonMap.containsKey('Name')) {
                    obj.Name = (String)jsonMap.get('Name');
                }
                return obj;
            }
        }
        public List<AnonymousEAVZG> Records { get; set; }
        public String RelatedRecordId { get; set; }
        public CopyPostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Records != null) jsonMap.put('Records', Records);
            if(RelatedRecordId != null) jsonMap.put('RelatedRecordId', RelatedRecordId);
            return jsonMap;
        }

        public static CopyPostRequest fromJson(Map<String, Object> jsonMap) {
            CopyPostRequest obj = new CopyPostRequest();
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<AnonymousEAVZG>)jsonMap.get('Records');
            }
            if(jsonMap.containsKey('RelatedRecordId')) {
                obj.RelatedRecordId = (String)jsonMap.get('RelatedRecordId');
            }
            return obj;
        }
    }
    public class CopyPostResponse {
        public class AnonymousDHY2P {
            public String OriginalId { get; set; }
            public String NewId { get; set; }
            public String FailReason { get; set; }
            public AnonymousDHY2P() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(OriginalId != null) jsonMap.put('OriginalId', OriginalId);
                if(NewId != null) jsonMap.put('NewId', NewId);
                if(FailReason != null) jsonMap.put('FailReason', FailReason);
                return jsonMap;
            }

            public static AnonymousDHY2P fromJson(Map<String, Object> jsonMap) {
                AnonymousDHY2P obj = new AnonymousDHY2P();
                if(jsonMap.containsKey('OriginalId')) {
                    obj.OriginalId = (String)jsonMap.get('OriginalId');
                }
                if(jsonMap.containsKey('NewId')) {
                    obj.NewId = (String)jsonMap.get('NewId');
                }
                if(jsonMap.containsKey('FailReason')) {
                    obj.FailReason = (String)jsonMap.get('FailReason');
                }
                return obj;
            }
        }
        public List<AnonymousDHY2P> Copies { get; set; }
        public CopyPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Copies != null) jsonMap.put('Copies', Copies);
            return jsonMap;
        }

        public static CopyPostResponse fromJson(Map<String, Object> jsonMap) {
            CopyPostResponse obj = new CopyPostResponse();
            if(jsonMap.containsKey('Copies')) {
                obj.Copies = (List<AnonymousDHY2P>)jsonMap.get('Copies');
            }
            return obj;
        }
    }
    public class HistoryGetResponse {
        public List<DocrioModels.HistoryRecordObject> Records { get; set; }
        public HistoryGetResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Records != null) jsonMap.put('Records', Records);
            return jsonMap;
        }

        public static HistoryGetResponse fromJson(Map<String, Object> jsonMap) {
            HistoryGetResponse obj = new HistoryGetResponse();
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<DocrioModels.HistoryRecordObject>)jsonMap.get('Records');
            }
            return obj;
        }
    }
    public class FavoritesGetResponse {
        public List<DocrioModels.FileRecordObject> Records { get; set; }
        public FavoritesGetResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Records != null) jsonMap.put('Records', Records);
            return jsonMap;
        }

        public static FavoritesGetResponse fromJson(Map<String, Object> jsonMap) {
            FavoritesGetResponse obj = new FavoritesGetResponse();
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<DocrioModels.FileRecordObject>)jsonMap.get('Records');
            }
            return obj;
        }
    }
    public class FolderPostRequest {
        public String recordId { get; set; }
        public String folderPath { get; set; }
        public FolderPostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(recordId != null) jsonMap.put('recordId', recordId);
            if(folderPath != null) jsonMap.put('folderPath', folderPath);
            return jsonMap;
        }

        public static FolderPostRequest fromJson(Map<String, Object> jsonMap) {
            FolderPostRequest obj = new FolderPostRequest();
            if(jsonMap.containsKey('recordId')) {
                obj.recordId = (String)jsonMap.get('recordId');
            }
            if(jsonMap.containsKey('folderPath')) {
                obj.folderPath = (String)jsonMap.get('folderPath');
            }
            return obj;
        }
    }
    public class FolderZipCreatePostRequest {
        public List<String> fileInfoIds { get; set; }
        public String IsArchived { get; set; }
        public FolderZipCreatePostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(fileInfoIds != null) jsonMap.put('fileInfoIds', fileInfoIds);
            if(IsArchived != null) jsonMap.put('IsArchived', IsArchived);
            return jsonMap;
        }

        public static FolderZipCreatePostRequest fromJson(Map<String, Object> jsonMap) {
            FolderZipCreatePostRequest obj = new FolderZipCreatePostRequest();
            if(jsonMap.containsKey('fileInfoIds')) {
                obj.fileInfoIds = (List<String>)jsonMap.get('fileInfoIds');
            }
            if(jsonMap.containsKey('IsArchived')) {
                obj.IsArchived = (String)jsonMap.get('IsArchived');
            }
            return obj;
        }
    }
    public class FolderZipCreatePostResponse {
        public String jobId { get; set; }
        public String presignedUrl { get; set; }
        public FolderZipCreatePostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(jobId != null) jsonMap.put('jobId', jobId);
            if(presignedUrl != null) jsonMap.put('presignedUrl', presignedUrl);
            return jsonMap;
        }

        public static FolderZipCreatePostResponse fromJson(Map<String, Object> jsonMap) {
            FolderZipCreatePostResponse obj = new FolderZipCreatePostResponse();
            if(jsonMap.containsKey('jobId')) {
                obj.jobId = (String)jsonMap.get('jobId');
            }
            if(jsonMap.containsKey('presignedUrl')) {
                obj.presignedUrl = (String)jsonMap.get('presignedUrl');
            }
            return obj;
        }
    }
    public class FolderZipCompletePostRequest {
        public String jobId { get; set; }
        public String IsArchived { get; set; }
        public FolderZipCompletePostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(jobId != null) jsonMap.put('jobId', jobId);
            if(IsArchived != null) jsonMap.put('IsArchived', IsArchived);
            return jsonMap;
        }

        public static FolderZipCompletePostRequest fromJson(Map<String, Object> jsonMap) {
            FolderZipCompletePostRequest obj = new FolderZipCompletePostRequest();
            if(jsonMap.containsKey('jobId')) {
                obj.jobId = (String)jsonMap.get('jobId');
            }
            if(jsonMap.containsKey('IsArchived')) {
                obj.IsArchived = (String)jsonMap.get('IsArchived');
            }
            return obj;
        }
    }
    public class UnzipStatusPostRequest {
        public List<String> jobIds { get; set; }
        public UnzipStatusPostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(jobIds != null) jsonMap.put('jobIds', jobIds);
            return jsonMap;
        }

        public static UnzipStatusPostRequest fromJson(Map<String, Object> jsonMap) {
            UnzipStatusPostRequest obj = new UnzipStatusPostRequest();
            if(jsonMap.containsKey('jobIds')) {
                obj.jobIds = (List<String>)jsonMap.get('jobIds');
            }
            return obj;
        }
    }
    public class PdfConvertCompletePostRequest {
        public List<String> jobIds { get; set; }
        public PdfConvertCompletePostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(jobIds != null) jsonMap.put('jobIds', jobIds);
            return jsonMap;
        }

        public static PdfConvertCompletePostRequest fromJson(Map<String, Object> jsonMap) {
            PdfConvertCompletePostRequest obj = new PdfConvertCompletePostRequest();
            if(jsonMap.containsKey('jobIds')) {
                obj.jobIds = (List<String>)jsonMap.get('jobIds');
            }
            return obj;
        }
    }
    public class FolderZipCompletePostResponse {
        public String jobId { get; set; }
        public Integer expirationTime { get; set; }
        public String status { get; set; }
        public List<String> fileInfoIds { get; set; }
        public String presignedUrl { get; set; }
        public FolderZipCompletePostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(jobId != null) jsonMap.put('jobId', jobId);
            if(expirationTime != null) jsonMap.put('expirationTime', expirationTime);
            if(status != null) jsonMap.put('status', status);
            if(fileInfoIds != null) jsonMap.put('fileInfoIds', fileInfoIds);
            if(presignedUrl != null) jsonMap.put('presignedUrl', presignedUrl);
            return jsonMap;
        }

        public static FolderZipCompletePostResponse fromJson(Map<String, Object> jsonMap) {
            FolderZipCompletePostResponse obj = new FolderZipCompletePostResponse();
            if(jsonMap.containsKey('jobId')) {
                obj.jobId = (String)jsonMap.get('jobId');
            }
            if(jsonMap.containsKey('expirationTime')) {
                obj.expirationTime = (Integer)jsonMap.get('expirationTime');
            }
            if(jsonMap.containsKey('status')) {
                obj.status = (String)jsonMap.get('status');
            }
            if(jsonMap.containsKey('fileInfoIds')) {
                obj.fileInfoIds = (List<String>)jsonMap.get('fileInfoIds');
            }
            if(jsonMap.containsKey('presignedUrl')) {
                obj.presignedUrl = (String)jsonMap.get('presignedUrl');
            }
            return obj;
        }
    }
    public class UnzipExistingPostResponse {
        public class Anonymous2WQ0S {
            public String Name { get; set; }
            public String jobId { get; set; }
            public String originalId { get; set; }
            public DocrioField litifyDocsRelatedTo { get; set; }
            public Anonymous2WQ0S() {
                this.litifyDocsRelatedTo = new DocrioField('litify_docs__Related_To__c');
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(Name != null) jsonMap.put('Name', Name);
                if(jobId != null) jsonMap.put('jobId', jobId);
                if(originalId != null) jsonMap.put('originalId', originalId);
                if(litifyDocsRelatedTo != null) jsonMap.put('litify_docs__Related_To__c', litifyDocsRelatedTo.toJson());
                return jsonMap;
            }

            public static Anonymous2WQ0S fromJson(Map<String, Object> jsonMap) {
                Anonymous2WQ0S obj = new Anonymous2WQ0S();
                if(jsonMap.containsKey('Name')) {
                    obj.Name = (String)jsonMap.get('Name');
                }
                if(jsonMap.containsKey('jobId')) {
                    obj.jobId = (String)jsonMap.get('jobId');
                }
                if(jsonMap.containsKey('originalId')) {
                    obj.originalId = (String)jsonMap.get('originalId');
                }
                if(jsonMap.containsKey('litify_docs__Related_To__c')) {
                    obj.litifyDocsRelatedTo.setValue((String)jsonMap.get('litify_docs__Related_To__c'));
                }
                return obj;
            }
        }
        public Anonymous2WQ0S nameOfFileZip { get; set; }
        public UnzipExistingPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(nameOfFileZip != null) jsonMap.put('name-of-file.zip', nameOfFileZip);
            return jsonMap;
        }

        public static UnzipExistingPostResponse fromJson(Map<String, Object> jsonMap) {
            UnzipExistingPostResponse obj = new UnzipExistingPostResponse();
            if(jsonMap.containsKey('name-of-file.zip')) {
                obj.nameOfFileZip = (Anonymous2WQ0S)jsonMap.get('name-of-file.zip');
            }
            return obj;
        }
    }
    public class UnzipStatusPostResponse {
        public class Anonymous5KXC1 {
            public String jobId { get; set; }
            public String status { get; set; }
            public Anonymous5KXC1() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(jobId != null) jsonMap.put('jobId', jobId);
                if(status != null) jsonMap.put('status', status);
                return jsonMap;
            }

            public static Anonymous5KXC1 fromJson(Map<String, Object> jsonMap) {
                Anonymous5KXC1 obj = new Anonymous5KXC1();
                if(jsonMap.containsKey('jobId')) {
                    obj.jobId = (String)jsonMap.get('jobId');
                }
                if(jsonMap.containsKey('status')) {
                    obj.status = (String)jsonMap.get('status');
                }
                return obj;
            }
        }
        public List<Anonymous5KXC1> jobStatuses { get; set; }
        public UnzipStatusPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(jobStatuses != null) jsonMap.put('jobStatuses', jobStatuses);
            return jsonMap;
        }

        public static UnzipStatusPostResponse fromJson(Map<String, Object> jsonMap) {
            UnzipStatusPostResponse obj = new UnzipStatusPostResponse();
            if(jsonMap.containsKey('jobStatuses')) {
                obj.jobStatuses = (List<Anonymous5KXC1>)jsonMap.get('jobStatuses');
            }
            return obj;
        }
    }
    public class PdfConvertPostResponse {
        public class AnonymousC6HAW {
            public String PDFConvertId { get; set; }
            public String Status { get; set; }
            public AnonymousC6HAW() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(PDFConvertId != null) jsonMap.put('PDFConvertId', PDFConvertId);
                if(Status != null) jsonMap.put('Status', Status);
                return jsonMap;
            }

            public static AnonymousC6HAW fromJson(Map<String, Object> jsonMap) {
                AnonymousC6HAW obj = new AnonymousC6HAW();
                if(jsonMap.containsKey('PDFConvertId')) {
                    obj.PDFConvertId = (String)jsonMap.get('PDFConvertId');
                }
                if(jsonMap.containsKey('Status')) {
                    obj.Status = (String)jsonMap.get('Status');
                }
                return obj;
            }
        }
        public List<AnonymousC6HAW> ConvertedFiles { get; set; }
        public PdfConvertPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(ConvertedFiles != null) jsonMap.put('ConvertedFiles', ConvertedFiles);
            return jsonMap;
        }

        public static PdfConvertPostResponse fromJson(Map<String, Object> jsonMap) {
            PdfConvertPostResponse obj = new PdfConvertPostResponse();
            if(jsonMap.containsKey('ConvertedFiles')) {
                obj.ConvertedFiles = (List<AnonymousC6HAW>)jsonMap.get('ConvertedFiles');
            }
            return obj;
        }
    }
    public class PdfConvertCompletePostResponse {
        public class AnonymousVGJSZ {
            public String jobId { get; set; }
            public String status { get; set; }
            public AnonymousVGJSZ() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(jobId != null) jsonMap.put('jobId', jobId);
                if(status != null) jsonMap.put('status', status);
                return jsonMap;
            }

            public static AnonymousVGJSZ fromJson(Map<String, Object> jsonMap) {
                AnonymousVGJSZ obj = new AnonymousVGJSZ();
                if(jsonMap.containsKey('jobId')) {
                    obj.jobId = (String)jsonMap.get('jobId');
                }
                if(jsonMap.containsKey('status')) {
                    obj.status = (String)jsonMap.get('status');
                }
                return obj;
            }
        }
        public List<AnonymousVGJSZ> jobStatuses { get; set; }
        public PdfConvertCompletePostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(jobStatuses != null) jsonMap.put('jobStatuses', jobStatuses);
            return jsonMap;
        }

        public static PdfConvertCompletePostResponse fromJson(Map<String, Object> jsonMap) {
            PdfConvertCompletePostResponse obj = new PdfConvertCompletePostResponse();
            if(jsonMap.containsKey('jobStatuses')) {
                obj.jobStatuses = (List<AnonymousVGJSZ>)jsonMap.get('jobStatuses');
            }
            return obj;
        }
    }
    public class VersionsGetResponse {
        public List<String> Versions { get; set; }
        public VersionsGetResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Versions != null) jsonMap.put('Versions', Versions);
            return jsonMap;
        }

        public static VersionsGetResponse fromJson(Map<String, Object> jsonMap) {
            VersionsGetResponse obj = new VersionsGetResponse();
            if(jsonMap.containsKey('Versions')) {
                obj.Versions = (List<String>)jsonMap.get('Versions');
            }
            return obj;
        }
    }
    public class PreviewPostRequest {
        public class AnonymousBAZ48 {
            public String PreviewType { get; set; }
            public String Id { get; set; }
            public String VersionId { get; set; }
            public AnonymousBAZ48() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(PreviewType != null) jsonMap.put('PreviewType', PreviewType);
                if(Id != null) jsonMap.put('Id', Id);
                if(VersionId != null) jsonMap.put('VersionId', VersionId);
                return jsonMap;
            }

            public static AnonymousBAZ48 fromJson(Map<String, Object> jsonMap) {
                AnonymousBAZ48 obj = new AnonymousBAZ48();
                if(jsonMap.containsKey('PreviewType')) {
                    obj.PreviewType = (String)jsonMap.get('PreviewType');
                }
                if(jsonMap.containsKey('Id')) {
                    obj.Id = (String)jsonMap.get('Id');
                }
                if(jsonMap.containsKey('VersionId')) {
                    obj.VersionId = (String)jsonMap.get('VersionId');
                }
                return obj;
            }
        }
        public List<AnonymousBAZ48> Records { get; set; }
        public String IsArchived { get; set; }
        public PreviewPostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Records != null) jsonMap.put('Records', Records);
            if(IsArchived != null) jsonMap.put('IsArchived', IsArchived);
            return jsonMap;
        }

        public static PreviewPostRequest fromJson(Map<String, Object> jsonMap) {
            PreviewPostRequest obj = new PreviewPostRequest();
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<AnonymousBAZ48>)jsonMap.get('Records');
            }
            if(jsonMap.containsKey('IsArchived')) {
                obj.IsArchived = (String)jsonMap.get('IsArchived');
            }
            return obj;
        }
    }
    public class PreviewPostResponse {
        public List<DocrioModels.SignedUrlObject> Records { get; set; }
        public PreviewPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Records != null) jsonMap.put('Records', Records);
            return jsonMap;
        }

        public static PreviewPostResponse fromJson(Map<String, Object> jsonMap) {
            PreviewPostResponse obj = new PreviewPostResponse();
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<DocrioModels.SignedUrlObject>)jsonMap.get('Records');
            }
            return obj;
        }
    }
    public class FilesInfoGetResponse {
        public List<DocrioModels.FileRecordObject> Records { get; set; }
        public FilesInfoGetResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Records != null) jsonMap.put('Records', Records);
            return jsonMap;
        }

        public static FilesInfoGetResponse fromJson(Map<String, Object> jsonMap) {
            FilesInfoGetResponse obj = new FilesInfoGetResponse();
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<DocrioModels.FileRecordObject>)jsonMap.get('Records');
            }
            return obj;
        }
    }
    public class FilesGetResponse {
        public List<DocrioModels.SignedUrlObject> Records { get; set; }
        public FilesGetResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Records != null) jsonMap.put('Records', Records);
            return jsonMap;
        }

        public static FilesGetResponse fromJson(Map<String, Object> jsonMap) {
            FilesGetResponse obj = new FilesGetResponse();
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<DocrioModels.SignedUrlObject>)jsonMap.get('Records');
            }
            return obj;
        }
    }
    public class FilesDeleteResponse {
        public List<String> Failures { get; set; }
        public FilesDeleteResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Failures != null) jsonMap.put('Failures', Failures);
            return jsonMap;
        }

        public static FilesDeleteResponse fromJson(Map<String, Object> jsonMap) {
            FilesDeleteResponse obj = new FilesDeleteResponse();
            if(jsonMap.containsKey('Failures')) {
                obj.Failures = (List<String>)jsonMap.get('Failures');
            }
            return obj;
        }
    }
    public class FilesPatchRequest {
        public String Id { get; set; }
        public String Name { get; set; }
        public DocrioField litifyDocsAuthor { get; set; }
        public DocrioField litifyDocsDescription { get; set; }
        public DocrioField litifyDocsExternalFilePath { get; set; }
        public DocrioField litifyDocsExternalId { get; set; }
        public DocrioField litifyDocsFolderPath { get; set; }
        public DocrioField litifyDocsFrom { get; set; }
        public DocrioField litifyDocsTo { get; set; }
        public DocrioField litifyDocsRelatedToApiName { get; set; }
        public DocrioField litifyDocsRelatedTo { get; set; }
        public DocrioField litifyDocsFileType { get; set; }
        public DocrioField customField { get; set; }
        public FilesPatchRequest() {
            this.litifyDocsAuthor = new DocrioField('litify_docs__Author__c');
            this.litifyDocsDescription = new DocrioField('litify_docs__Description__c');
            this.litifyDocsExternalFilePath = new DocrioField('litify_docs__External_File_Path__c');
            this.litifyDocsExternalId = new DocrioField('litify_docs__External_ID__c');
            this.litifyDocsFolderPath = new DocrioField('litify_docs__Folder_Path__c');
            this.litifyDocsFrom = new DocrioField('litify_docs__From__c');
            this.litifyDocsTo = new DocrioField('litify_docs__To__c');
            this.litifyDocsRelatedToApiName = new DocrioField('litify_docs__Related_To_Api_Name__c');
            this.litifyDocsRelatedTo = new DocrioField('litify_docs__Related_To__c');
            this.litifyDocsFileType = new DocrioField('litify_docs__File_Type__c');
            this.customField = new DocrioField('Custom_Field__c');
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Id != null) jsonMap.put('Id', Id);
            if(Name != null) jsonMap.put('Name', Name);
            if(litifyDocsAuthor != null) jsonMap.put('litify_docs__Author__c', litifyDocsAuthor.toJson());
            if(litifyDocsDescription != null) jsonMap.put('litify_docs__Description__c', litifyDocsDescription.toJson());
            if(litifyDocsExternalFilePath != null) jsonMap.put('litify_docs__External_File_Path__c', litifyDocsExternalFilePath.toJson());
            if(litifyDocsExternalId != null) jsonMap.put('litify_docs__External_ID__c', litifyDocsExternalId.toJson());
            if(litifyDocsFolderPath != null) jsonMap.put('litify_docs__Folder_Path__c', litifyDocsFolderPath.toJson());
            if(litifyDocsFrom != null) jsonMap.put('litify_docs__From__c', litifyDocsFrom.toJson());
            if(litifyDocsTo != null) jsonMap.put('litify_docs__To__c', litifyDocsTo.toJson());
            if(litifyDocsRelatedToApiName != null) jsonMap.put('litify_docs__Related_To_Api_Name__c', litifyDocsRelatedToApiName.toJson());
            if(litifyDocsRelatedTo != null) jsonMap.put('litify_docs__Related_To__c', litifyDocsRelatedTo.toJson());
            if(litifyDocsFileType != null) jsonMap.put('litify_docs__File_Type__c', litifyDocsFileType.toJson());
            if(customField != null) jsonMap.put('Custom_Field__c', customField.toJson());
            return jsonMap;
        }

        public static FilesPatchRequest fromJson(Map<String, Object> jsonMap) {
            FilesPatchRequest obj = new FilesPatchRequest();
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            if(jsonMap.containsKey('Name')) {
                obj.Name = (String)jsonMap.get('Name');
            }
            if(jsonMap.containsKey('litify_docs__Author__c')) {
                obj.litifyDocsAuthor.setValue((String)jsonMap.get('litify_docs__Author__c'));
            }
            if(jsonMap.containsKey('litify_docs__Description__c')) {
                obj.litifyDocsDescription.setValue((String)jsonMap.get('litify_docs__Description__c'));
            }
            if(jsonMap.containsKey('litify_docs__External_File_Path__c')) {
                obj.litifyDocsExternalFilePath.setValue((String)jsonMap.get('litify_docs__External_File_Path__c'));
            }
            if(jsonMap.containsKey('litify_docs__External_ID__c')) {
                obj.litifyDocsExternalId.setValue((String)jsonMap.get('litify_docs__External_ID__c'));
            }
            if(jsonMap.containsKey('litify_docs__Folder_Path__c')) {
                obj.litifyDocsFolderPath.setValue((String)jsonMap.get('litify_docs__Folder_Path__c'));
            }
            if(jsonMap.containsKey('litify_docs__From__c')) {
                obj.litifyDocsFrom.setValue((String)jsonMap.get('litify_docs__From__c'));
            }
            if(jsonMap.containsKey('litify_docs__To__c')) {
                obj.litifyDocsTo.setValue((String)jsonMap.get('litify_docs__To__c'));
            }
            if(jsonMap.containsKey('litify_docs__Related_To_Api_Name__c')) {
                obj.litifyDocsRelatedToApiName.setValue((String)jsonMap.get('litify_docs__Related_To_Api_Name__c'));
            }
            if(jsonMap.containsKey('litify_docs__Related_To__c')) {
                obj.litifyDocsRelatedTo.setValue((String)jsonMap.get('litify_docs__Related_To__c'));
            }
            if(jsonMap.containsKey('litify_docs__File_Type__c')) {
                obj.litifyDocsFileType.setValue((String)jsonMap.get('litify_docs__File_Type__c'));
            }
            if(jsonMap.containsKey('Custom_Field__c')) {
                obj.customField.setValue((String)jsonMap.get('Custom_Field__c'));
            }
            return obj;
        }
    }
    public class FilesPutRequest {
        public String Id { get; set; }
        public FilesPutRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Id != null) jsonMap.put('Id', Id);
            return jsonMap;
        }

        public static FilesPutRequest fromJson(Map<String, Object> jsonMap) {
            FilesPutRequest obj = new FilesPutRequest();
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            return obj;
        }
    }
    public class FilesPostResponse {
        public DocrioModels.SignedUrlObject nameOfFilePng { get; set; }
        public FilesPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(nameOfFilePng != null) jsonMap.put('name-of-file.png', nameOfFilePng);
            return jsonMap;
        }

        public static FilesPostResponse fromJson(Map<String, Object> jsonMap) {
            FilesPostResponse obj = new FilesPostResponse();
            if(jsonMap.containsKey('name-of-file.png')) {
                obj.nameOfFilePng = (DocrioModels.SignedUrlObject)jsonMap.get('name-of-file.png');
            }
            return obj;
        }
    }
    public class FilesTAPostResponse {
        public DocrioModels.SignedUrlObject nameOfFilePng { get; set; }
        public FilesTAPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(nameOfFilePng != null) jsonMap.put('name-of-file.png', nameOfFilePng);
            return jsonMap;
        }

        public static FilesTAPostResponse fromJson(Map<String, Object> jsonMap) {
            FilesTAPostResponse obj = new FilesTAPostResponse();
            if(jsonMap.containsKey('name-of-file.png')) {
                obj.nameOfFilePng = (DocrioModels.SignedUrlObject)jsonMap.get('name-of-file.png');
            }
            return obj;
        }
    }
    public class MultipartFilesPutRequest {
        public String Id { get; set; }
        public Integer Parts { get; set; }
        public String ContentType { get; set; }
        public Integer fileVersionNumber { get; set; }
        public MultipartFilesPutRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Id != null) jsonMap.put('Id', Id);
            if(Parts != null) jsonMap.put('Parts', Parts);
            if(ContentType != null) jsonMap.put('ContentType', ContentType);
            if(fileVersionNumber != null) jsonMap.put('fileVersionNumber', fileVersionNumber);
            return jsonMap;
        }

        public static MultipartFilesPutRequest fromJson(Map<String, Object> jsonMap) {
            MultipartFilesPutRequest obj = new MultipartFilesPutRequest();
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            if(jsonMap.containsKey('Parts')) {
                obj.Parts = (Integer)jsonMap.get('Parts');
            }
            if(jsonMap.containsKey('ContentType')) {
                obj.ContentType = (String)jsonMap.get('ContentType');
            }
            if(jsonMap.containsKey('fileVersionNumber')) {
                obj.fileVersionNumber = (Integer)jsonMap.get('fileVersionNumber');
            }
            return obj;
        }
    }
    public class MultipartFilesPostResponse {
        public DocrioModels.MultipartSignedUrlObject nameOfFilePng { get; set; }
        public MultipartFilesPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(nameOfFilePng != null) jsonMap.put('name-of-file.png', nameOfFilePng);
            return jsonMap;
        }

        public static MultipartFilesPostResponse fromJson(Map<String, Object> jsonMap) {
            MultipartFilesPostResponse obj = new MultipartFilesPostResponse();
            if(jsonMap.containsKey('name-of-file.png')) {
                obj.nameOfFilePng = (DocrioModels.MultipartSignedUrlObject)jsonMap.get('name-of-file.png');
            }
            return obj;
        }
    }
    public class MultipartFilesPutResponse {
        public DocrioModels.MultipartSignedUrlObject nameOfFilePng { get; set; }
        public MultipartFilesPutResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(nameOfFilePng != null) jsonMap.put('name-of-file.png', nameOfFilePng);
            return jsonMap;
        }

        public static MultipartFilesPutResponse fromJson(Map<String, Object> jsonMap) {
            MultipartFilesPutResponse obj = new MultipartFilesPutResponse();
            if(jsonMap.containsKey('name-of-file.png')) {
                obj.nameOfFilePng = (DocrioModels.MultipartSignedUrlObject)jsonMap.get('name-of-file.png');
            }
            return obj;
        }
    }
    public class MultipartFilesCompletePostRequest {
        public class Anonymous7Z6HP {
            public class AnonymousPCTAG {
                public Integer PartNumber { get; set; }
                public String ETag { get; set; }
                public AnonymousPCTAG() {
                }

                public Map<String, Object> toJson() {
                    Map<String, Object> jsonMap = new Map<String, Object>();
                    if(PartNumber != null) jsonMap.put('PartNumber', PartNumber);
                    if(ETag != null) jsonMap.put('ETag', ETag);
                    return jsonMap;
                }

                public static AnonymousPCTAG fromJson(Map<String, Object> jsonMap) {
                    AnonymousPCTAG obj = new AnonymousPCTAG();
                    if(jsonMap.containsKey('PartNumber')) {
                        obj.PartNumber = (Integer)jsonMap.get('PartNumber');
                    }
                    if(jsonMap.containsKey('ETag')) {
                        obj.ETag = (String)jsonMap.get('ETag');
                    }
                    return obj;
                }
            }
            public String UploadId { get; set; }
            public List<AnonymousPCTAG> Parts { get; set; }
            public Anonymous7Z6HP() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(UploadId != null) jsonMap.put('UploadId', UploadId);
                if(Parts != null) jsonMap.put('Parts', Parts);
                return jsonMap;
            }

            public static Anonymous7Z6HP fromJson(Map<String, Object> jsonMap) {
                Anonymous7Z6HP obj = new Anonymous7Z6HP();
                if(jsonMap.containsKey('UploadId')) {
                    obj.UploadId = (String)jsonMap.get('UploadId');
                }
                if(jsonMap.containsKey('Parts')) {
                    obj.Parts = (List<AnonymousPCTAG>)jsonMap.get('Parts');
                }
                return obj;
            }
        }
        public List<String> Ids { get; set; }
        public Anonymous7Z6HP a1E1U000001juz6UAA { get; set; }
        public MultipartFilesCompletePostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Ids != null) jsonMap.put('Ids', Ids);
            if(a1E1U000001juz6UAA != null) jsonMap.put('a1E1U000001juz6UAA', a1E1U000001juz6UAA);
            return jsonMap;
        }

        public static MultipartFilesCompletePostRequest fromJson(Map<String, Object> jsonMap) {
            MultipartFilesCompletePostRequest obj = new MultipartFilesCompletePostRequest();
            if(jsonMap.containsKey('Ids')) {
                obj.Ids = (List<String>)jsonMap.get('Ids');
            }
            if(jsonMap.containsKey('a1E1U000001juz6UAA')) {
                obj.a1E1U000001juz6UAA = (Anonymous7Z6HP)jsonMap.get('a1E1U000001juz6UAA');
            }
            return obj;
        }
    }
    public class MultipartFilesCompletePostResponse {
        public String Message { get; set; }
        public List<DocrioModels.MultipartFileRecordObject> Successes { get; set; }
        public List<String> Failures { get; set; }
        public MultipartFilesCompletePostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Message != null) jsonMap.put('Message', Message);
            if(Successes != null) jsonMap.put('Successes', Successes);
            if(Failures != null) jsonMap.put('Failures', Failures);
            return jsonMap;
        }

        public static MultipartFilesCompletePostResponse fromJson(Map<String, Object> jsonMap) {
            MultipartFilesCompletePostResponse obj = new MultipartFilesCompletePostResponse();
            if(jsonMap.containsKey('Message')) {
                obj.Message = (String)jsonMap.get('Message');
            }
            if(jsonMap.containsKey('Successes')) {
                obj.Successes = (List<DocrioModels.MultipartFileRecordObject>)jsonMap.get('Successes');
            }
            if(jsonMap.containsKey('Failures')) {
                obj.Failures = (List<String>)jsonMap.get('Failures');
            }
            return obj;
        }
    }
    public class MultipartRefreshUrlsPutResponse {
        public DocrioModels.MultipartSignedUrlObject nameOfFilePng { get; set; }
        public MultipartRefreshUrlsPutResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(nameOfFilePng != null) jsonMap.put('name-of-file.png', nameOfFilePng);
            return jsonMap;
        }

        public static MultipartRefreshUrlsPutResponse fromJson(Map<String, Object> jsonMap) {
            MultipartRefreshUrlsPutResponse obj = new MultipartRefreshUrlsPutResponse();
            if(jsonMap.containsKey('name-of-file.png')) {
                obj.nameOfFilePng = (DocrioModels.MultipartSignedUrlObject)jsonMap.get('name-of-file.png');
            }
            return obj;
        }
    }
    public class MultipartFilesRefreshPutRequest {
        public String Id { get; set; }
        public String UploadId { get; set; }
        public Integer StartIndex { get; set; }
        public Integer EndIndex { get; set; }
        public MultipartFilesRefreshPutRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Id != null) jsonMap.put('Id', Id);
            if(UploadId != null) jsonMap.put('UploadId', UploadId);
            if(StartIndex != null) jsonMap.put('StartIndex', StartIndex);
            if(EndIndex != null) jsonMap.put('EndIndex', EndIndex);
            return jsonMap;
        }

        public static MultipartFilesRefreshPutRequest fromJson(Map<String, Object> jsonMap) {
            MultipartFilesRefreshPutRequest obj = new MultipartFilesRefreshPutRequest();
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            if(jsonMap.containsKey('UploadId')) {
                obj.UploadId = (String)jsonMap.get('UploadId');
            }
            if(jsonMap.containsKey('StartIndex')) {
                obj.StartIndex = (Integer)jsonMap.get('StartIndex');
            }
            if(jsonMap.containsKey('EndIndex')) {
                obj.EndIndex = (Integer)jsonMap.get('EndIndex');
            }
            return obj;
        }
    }
    public class MultipartFilesRefreshPutResponse {
        public String Message { get; set; }
        public List<DocrioModels.MultipartFileRecordObject> Successes { get; set; }
        public List<String> Failures { get; set; }
        public MultipartFilesRefreshPutResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Message != null) jsonMap.put('Message', Message);
            if(Successes != null) jsonMap.put('Successes', Successes);
            if(Failures != null) jsonMap.put('Failures', Failures);
            return jsonMap;
        }

        public static MultipartFilesRefreshPutResponse fromJson(Map<String, Object> jsonMap) {
            MultipartFilesRefreshPutResponse obj = new MultipartFilesRefreshPutResponse();
            if(jsonMap.containsKey('Message')) {
                obj.Message = (String)jsonMap.get('Message');
            }
            if(jsonMap.containsKey('Successes')) {
                obj.Successes = (List<DocrioModels.MultipartFileRecordObject>)jsonMap.get('Successes');
            }
            if(jsonMap.containsKey('Failures')) {
                obj.Failures = (List<String>)jsonMap.get('Failures');
            }
            return obj;
        }
    }
    public class FilesAssociatePostRequest {
        public class AnonymousL3OJJ {
            public String fileOne { get; set; }
            public String fileTwo { get; set; }
            public AnonymousL3OJJ() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(fileOne != null) jsonMap.put('fileOne', fileOne);
                if(fileTwo != null) jsonMap.put('fileTwo', fileTwo);
                return jsonMap;
            }

            public static AnonymousL3OJJ fromJson(Map<String, Object> jsonMap) {
                AnonymousL3OJJ obj = new AnonymousL3OJJ();
                if(jsonMap.containsKey('fileOne')) {
                    obj.fileOne = (String)jsonMap.get('fileOne');
                }
                if(jsonMap.containsKey('fileTwo')) {
                    obj.fileTwo = (String)jsonMap.get('fileTwo');
                }
                return obj;
            }
        }
        public List<AnonymousL3OJJ> fileRelationships { get; set; }
        public String relationshipType { get; set; }
        public FilesAssociatePostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(fileRelationships != null) jsonMap.put('fileRelationships', fileRelationships);
            if(relationshipType != null) jsonMap.put('relationshipType', relationshipType);
            return jsonMap;
        }

        public static FilesAssociatePostRequest fromJson(Map<String, Object> jsonMap) {
            FilesAssociatePostRequest obj = new FilesAssociatePostRequest();
            if(jsonMap.containsKey('fileRelationships')) {
                obj.fileRelationships = (List<AnonymousL3OJJ>)jsonMap.get('fileRelationships');
            }
            if(jsonMap.containsKey('relationshipType')) {
                obj.relationshipType = (String)jsonMap.get('relationshipType');
            }
            return obj;
        }
    }
    public class FilesAssociatePostResponse {
        public String Message { get; set; }
        public FilesAssociatePostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Message != null) jsonMap.put('Message', Message);
            return jsonMap;
        }

        public static FilesAssociatePostResponse fromJson(Map<String, Object> jsonMap) {
            FilesAssociatePostResponse obj = new FilesAssociatePostResponse();
            if(jsonMap.containsKey('Message')) {
                obj.Message = (String)jsonMap.get('Message');
            }
            return obj;
        }
    }
    public class FilesAssociateDeleteRequest {
        public class AnonymousWSIMI {
            public String fileOne { get; set; }
            public String fileTwo { get; set; }
            public AnonymousWSIMI() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(fileOne != null) jsonMap.put('fileOne', fileOne);
                if(fileTwo != null) jsonMap.put('fileTwo', fileTwo);
                return jsonMap;
            }

            public static AnonymousWSIMI fromJson(Map<String, Object> jsonMap) {
                AnonymousWSIMI obj = new AnonymousWSIMI();
                if(jsonMap.containsKey('fileOne')) {
                    obj.fileOne = (String)jsonMap.get('fileOne');
                }
                if(jsonMap.containsKey('fileTwo')) {
                    obj.fileTwo = (String)jsonMap.get('fileTwo');
                }
                return obj;
            }
        }
        public List<AnonymousWSIMI> fileRelationships { get; set; }
        public FilesAssociateDeleteRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(fileRelationships != null) jsonMap.put('fileRelationships', fileRelationships);
            return jsonMap;
        }

        public static FilesAssociateDeleteRequest fromJson(Map<String, Object> jsonMap) {
            FilesAssociateDeleteRequest obj = new FilesAssociateDeleteRequest();
            if(jsonMap.containsKey('fileRelationships')) {
                obj.fileRelationships = (List<AnonymousWSIMI>)jsonMap.get('fileRelationships');
            }
            return obj;
        }
    }
    public class FilesCompletePostRequest {
        public List<String> Ids { get; set; }
        public Boolean CheckIn { get; set; }
        public FilesCompletePostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Ids != null) jsonMap.put('Ids', Ids);
            if(CheckIn != null) jsonMap.put('CheckIn', CheckIn);
            return jsonMap;
        }

        public static FilesCompletePostRequest fromJson(Map<String, Object> jsonMap) {
            FilesCompletePostRequest obj = new FilesCompletePostRequest();
            if(jsonMap.containsKey('Ids')) {
                obj.Ids = (List<String>)jsonMap.get('Ids');
            }
            if(jsonMap.containsKey('CheckIn')) {
                obj.CheckIn = (Boolean)jsonMap.get('CheckIn');
            }
            return obj;
        }
    }
    public class FilesCompletePostResponse {
        public String Message { get; set; }
        public List<DocrioModels.FileRecordObject> Successes { get; set; }
        public List<String> Failures { get; set; }
        public FilesCompletePostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Message != null) jsonMap.put('Message', Message);
            if(Successes != null) jsonMap.put('Successes', Successes);
            if(Failures != null) jsonMap.put('Failures', Failures);
            return jsonMap;
        }

        public static FilesCompletePostResponse fromJson(Map<String, Object> jsonMap) {
            FilesCompletePostResponse obj = new FilesCompletePostResponse();
            if(jsonMap.containsKey('Message')) {
                obj.Message = (String)jsonMap.get('Message');
            }
            if(jsonMap.containsKey('Successes')) {
                obj.Successes = (List<DocrioModels.FileRecordObject>)jsonMap.get('Successes');
            }
            if(jsonMap.containsKey('Failures')) {
                obj.Failures = (List<String>)jsonMap.get('Failures');
            }
            return obj;
        }
    }
    public class FilesRelatedGetResponse {
        public DocrioModels.FileRecordObject Records { get; set; }
        public DocrioModels.NextBatchObject NextBatch { get; set; }
        public FilesRelatedGetResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Records != null) jsonMap.put('Records', Records);
            if(NextBatch != null) jsonMap.put('NextBatch', NextBatch);
            return jsonMap;
        }

        public static FilesRelatedGetResponse fromJson(Map<String, Object> jsonMap) {
            FilesRelatedGetResponse obj = new FilesRelatedGetResponse();
            if(jsonMap.containsKey('Records')) {
                obj.Records = (DocrioModels.FileRecordObject)jsonMap.get('Records');
            }
            if(jsonMap.containsKey('NextBatch')) {
                obj.NextBatch = (DocrioModels.NextBatchObject)jsonMap.get('NextBatch');
            }
            return obj;
        }
    }
    public class FilesToggleRequest {
        // salesforce file Id
        public List<String> Ids { get; set; }
        public FilesToggleRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Ids != null) jsonMap.put('Ids', Ids);
            return jsonMap;
        }

        public static FilesToggleRequest fromJson(Map<String, Object> jsonMap) {
            FilesToggleRequest obj = new FilesToggleRequest();
            if(jsonMap.containsKey('Ids')) {
                obj.Ids = (List<String>)jsonMap.get('Ids');
            }
            return obj;
        }
    }
    public class FilesToggleResponse {
        public String Message { get; set; }
        public FilesToggleResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Message != null) jsonMap.put('Message', Message);
            return jsonMap;
        }

        public static FilesToggleResponse fromJson(Map<String, Object> jsonMap) {
            FilesToggleResponse obj = new FilesToggleResponse();
            if(jsonMap.containsKey('Message')) {
                obj.Message = (String)jsonMap.get('Message');
            }
            return obj;
        }
    }
    public class FilesCombineRequest {
        public class AnonymousYUCHO {
            public String name { get; set; }
            public String fileInfoId { get; set; }
            public String fileType { get; set; }
            public AnonymousYUCHO() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(name != null) jsonMap.put('name', name);
                if(fileInfoId != null) jsonMap.put('fileInfoId', fileInfoId);
                if(fileType != null) jsonMap.put('fileType', fileType);
                return jsonMap;
            }

            public static AnonymousYUCHO fromJson(Map<String, Object> jsonMap) {
                AnonymousYUCHO obj = new AnonymousYUCHO();
                if(jsonMap.containsKey('name')) {
                    obj.name = (String)jsonMap.get('name');
                }
                if(jsonMap.containsKey('fileInfoId')) {
                    obj.fileInfoId = (String)jsonMap.get('fileInfoId');
                }
                if(jsonMap.containsKey('fileType')) {
                    obj.fileType = (String)jsonMap.get('fileType');
                }
                return obj;
            }
        }
        public String relatedToApiName { get; set; }
        public String fileRelatedTo { get; set; }
        public String fileName { get; set; }
        public String folderPath { get; set; }
        public List<AnonymousYUCHO> combineFiles { get; set; }
        public FilesCombineRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(relatedToApiName != null) jsonMap.put('relatedToApiName', relatedToApiName);
            if(fileRelatedTo != null) jsonMap.put('fileRelatedTo', fileRelatedTo);
            if(fileName != null) jsonMap.put('fileName', fileName);
            if(folderPath != null) jsonMap.put('folderPath', folderPath);
            if(combineFiles != null) jsonMap.put('combineFiles', combineFiles);
            return jsonMap;
        }

        public static FilesCombineRequest fromJson(Map<String, Object> jsonMap) {
            FilesCombineRequest obj = new FilesCombineRequest();
            if(jsonMap.containsKey('relatedToApiName')) {
                obj.relatedToApiName = (String)jsonMap.get('relatedToApiName');
            }
            if(jsonMap.containsKey('fileRelatedTo')) {
                obj.fileRelatedTo = (String)jsonMap.get('fileRelatedTo');
            }
            if(jsonMap.containsKey('fileName')) {
                obj.fileName = (String)jsonMap.get('fileName');
            }
            if(jsonMap.containsKey('folderPath')) {
                obj.folderPath = (String)jsonMap.get('folderPath');
            }
            if(jsonMap.containsKey('combineFiles')) {
                obj.combineFiles = (List<AnonymousYUCHO>)jsonMap.get('combineFiles');
            }
            return obj;
        }
    }
    public class FilesSplitRequest {
        public class AnonymousSESLO {
            public String fileName { get; set; }
            public Object pages { get; set; }
            public String fileType { get; set; }
            public AnonymousSESLO() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(fileName != null) jsonMap.put('fileName', fileName);
                if(pages != null) jsonMap.put('pages', pages);
                if(fileType != null) jsonMap.put('fileType', fileType);
                return jsonMap;
            }

            public static AnonymousSESLO fromJson(Map<String, Object> jsonMap) {
                AnonymousSESLO obj = new AnonymousSESLO();
                if(jsonMap.containsKey('fileName')) {
                    obj.fileName = (String)jsonMap.get('fileName');
                }
                if(jsonMap.containsKey('pages')) {
                    obj.pages = (Object)jsonMap.get('pages');
                }
                if(jsonMap.containsKey('fileType')) {
                    obj.fileType = (String)jsonMap.get('fileType');
                }
                return obj;
            }
        }
        public String originalFileId { get; set; }
        public String originalFileRelatedTo { get; set; }
        public String originalFolderPath { get; set; }
        public String relatedToApiName { get; set; }
        public String originalFileType { get; set; }
        public List<AnonymousSESLO> sections { get; set; }
        public FilesSplitRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(originalFileId != null) jsonMap.put('originalFileId', originalFileId);
            if(originalFileRelatedTo != null) jsonMap.put('originalFileRelatedTo', originalFileRelatedTo);
            if(originalFolderPath != null) jsonMap.put('originalFolderPath', originalFolderPath);
            if(relatedToApiName != null) jsonMap.put('relatedToApiName', relatedToApiName);
            if(originalFileType != null) jsonMap.put('originalFileType', originalFileType);
            if(sections != null) jsonMap.put('sections', sections);
            return jsonMap;
        }

        public static FilesSplitRequest fromJson(Map<String, Object> jsonMap) {
            FilesSplitRequest obj = new FilesSplitRequest();
            if(jsonMap.containsKey('originalFileId')) {
                obj.originalFileId = (String)jsonMap.get('originalFileId');
            }
            if(jsonMap.containsKey('originalFileRelatedTo')) {
                obj.originalFileRelatedTo = (String)jsonMap.get('originalFileRelatedTo');
            }
            if(jsonMap.containsKey('originalFolderPath')) {
                obj.originalFolderPath = (String)jsonMap.get('originalFolderPath');
            }
            if(jsonMap.containsKey('relatedToApiName')) {
                obj.relatedToApiName = (String)jsonMap.get('relatedToApiName');
            }
            if(jsonMap.containsKey('originalFileType')) {
                obj.originalFileType = (String)jsonMap.get('originalFileType');
            }
            if(jsonMap.containsKey('sections')) {
                obj.sections = (List<AnonymousSESLO>)jsonMap.get('sections');
            }
            return obj;
        }
    }
    public class FilesCombineResponse {
        public String Name { get; set; }
        public String Id { get; set; }
        public DocrioField litifyDocsFileType { get; set; }
        public FilesCombineResponse() {
            this.litifyDocsFileType = new DocrioField('litify_docs__File_Type__c');
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Name != null) jsonMap.put('Name', Name);
            if(Id != null) jsonMap.put('Id', Id);
            if(litifyDocsFileType != null) jsonMap.put('litify_docs__File_Type__c', litifyDocsFileType.toJson());
            return jsonMap;
        }

        public static FilesCombineResponse fromJson(Map<String, Object> jsonMap) {
            FilesCombineResponse obj = new FilesCombineResponse();
            if(jsonMap.containsKey('Name')) {
                obj.Name = (String)jsonMap.get('Name');
            }
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            if(jsonMap.containsKey('litify_docs__File_Type__c')) {
                obj.litifyDocsFileType.setValue((String)jsonMap.get('litify_docs__File_Type__c'));
            }
            return obj;
        }
    }
    public class FilesCombineCompleteRequest {
        public String Id { get; set; }
        public FilesCombineCompleteRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Id != null) jsonMap.put('Id', Id);
            return jsonMap;
        }

        public static FilesCombineCompleteRequest fromJson(Map<String, Object> jsonMap) {
            FilesCombineCompleteRequest obj = new FilesCombineCompleteRequest();
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            return obj;
        }
    }
    public class FilesCombineCompleteResponse {
        public class Anonymous3JE2E {
            public Integer expirationTime { get; set; }
            public String jobId { get; set; }
            public String status { get; set; }
            public Anonymous3JE2E() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(expirationTime != null) jsonMap.put('expirationTime', expirationTime);
                if(jobId != null) jsonMap.put('jobId', jobId);
                if(status != null) jsonMap.put('status', status);
                return jsonMap;
            }

            public static Anonymous3JE2E fromJson(Map<String, Object> jsonMap) {
                Anonymous3JE2E obj = new Anonymous3JE2E();
                if(jsonMap.containsKey('expirationTime')) {
                    obj.expirationTime = (Integer)jsonMap.get('expirationTime');
                }
                if(jsonMap.containsKey('jobId')) {
                    obj.jobId = (String)jsonMap.get('jobId');
                }
                if(jsonMap.containsKey('status')) {
                    obj.status = (String)jsonMap.get('status');
                }
                return obj;
            }
        }
        public Map<String, Object> Errors { get; set; }
        public List<Anonymous3JE2E> Statuses { get; set; }
        public FilesCombineCompleteResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Errors != null) jsonMap.put('Errors', Errors);
            if(Statuses != null) jsonMap.put('Statuses', Statuses);
            return jsonMap;
        }

        public static FilesCombineCompleteResponse fromJson(Map<String, Object> jsonMap) {
            FilesCombineCompleteResponse obj = new FilesCombineCompleteResponse();
            if(jsonMap.containsKey('Errors')) {
                obj.Errors = (Map<String, Object>)jsonMap.get('Errors');
            }
            if(jsonMap.containsKey('Statuses')) {
                obj.Statuses = (List<Anonymous3JE2E>)jsonMap.get('Statuses');
            }
            return obj;
        }
    }
    public class FilesSplitResponse {
        public Object fileInfoRecords { get; set; }
        public FilesSplitResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(fileInfoRecords != null) jsonMap.put('fileInfoRecords', fileInfoRecords);
            return jsonMap;
        }

        public static FilesSplitResponse fromJson(Map<String, Object> jsonMap) {
            FilesSplitResponse obj = new FilesSplitResponse();
            if(jsonMap.containsKey('fileInfoRecords')) {
                obj.fileInfoRecords = (Object)jsonMap.get('fileInfoRecords');
            }
            return obj;
        }
    }
    public class FilesSplitCompleteRequest {
        public Object Ids { get; set; }
        public FilesSplitCompleteRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Ids != null) jsonMap.put('Ids', Ids);
            return jsonMap;
        }

        public static FilesSplitCompleteRequest fromJson(Map<String, Object> jsonMap) {
            FilesSplitCompleteRequest obj = new FilesSplitCompleteRequest();
            if(jsonMap.containsKey('Ids')) {
                obj.Ids = (Object)jsonMap.get('Ids');
            }
            return obj;
        }
    }
    public class FilesSplitCompleteResponse {
        public Map<String, Object> Errors { get; set; }
        public Object Statuses { get; set; }
        public FilesSplitCompleteResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Errors != null) jsonMap.put('Errors', Errors);
            if(Statuses != null) jsonMap.put('Statuses', Statuses);
            return jsonMap;
        }

        public static FilesSplitCompleteResponse fromJson(Map<String, Object> jsonMap) {
            FilesSplitCompleteResponse obj = new FilesSplitCompleteResponse();
            if(jsonMap.containsKey('Errors')) {
                obj.Errors = (Map<String, Object>)jsonMap.get('Errors');
            }
            if(jsonMap.containsKey('Statuses')) {
                obj.Statuses = (Object)jsonMap.get('Statuses');
            }
            return obj;
        }
    }
    public class ErrorMessageResponse {
        public String Message { get; set; }
        public ErrorMessageResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Message != null) jsonMap.put('Message', Message);
            return jsonMap;
        }

        public static ErrorMessageResponse fromJson(Map<String, Object> jsonMap) {
            ErrorMessageResponse obj = new ErrorMessageResponse();
            if(jsonMap.containsKey('Message')) {
                obj.Message = (String)jsonMap.get('Message');
            }
            return obj;
        }
    }
    public class ErrorMessageResponseWithFailReason {
        public String Message { get; set; }
        public String FailReason { get; set; }
        public ErrorMessageResponseWithFailReason() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Message != null) jsonMap.put('Message', Message);
            if(FailReason != null) jsonMap.put('FailReason', FailReason);
            return jsonMap;
        }

        public static ErrorMessageResponseWithFailReason fromJson(Map<String, Object> jsonMap) {
            ErrorMessageResponseWithFailReason obj = new ErrorMessageResponseWithFailReason();
            if(jsonMap.containsKey('Message')) {
                obj.Message = (String)jsonMap.get('Message');
            }
            if(jsonMap.containsKey('FailReason')) {
                obj.FailReason = (String)jsonMap.get('FailReason');
            }
            return obj;
        }
    }
    public class ExternalLinkPostRequest {
        public class Anonymous1ZX8R {
            public DocrioField litifyDocsExpirationDate { get; set; }
            public DocrioField litifyDocsFileSize { get; set; }
            public DocrioField litifyDocsFileType { get; set; }
            public DocrioField litifyDocsPassword { get; set; }
            public DocrioField litifyDocsUniqueId { get; set; }
            public Anonymous1ZX8R() {
                this.litifyDocsExpirationDate = new DocrioField('litify_docs__Expiration_Date__c');
                this.litifyDocsFileSize = new DocrioField('litify_docs__File_Size__c');
                this.litifyDocsFileType = new DocrioField('litify_docs__File_Type__c');
                this.litifyDocsPassword = new DocrioField('litify_docs__Password__c');
                this.litifyDocsUniqueId = new DocrioField('litify_docs__Unique_Id__c');
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(litifyDocsExpirationDate != null) jsonMap.put('litify_docs__Expiration_Date__c', litifyDocsExpirationDate.toJson());
                if(litifyDocsFileSize != null) jsonMap.put('litify_docs__File_Size__c', litifyDocsFileSize.toJson());
                if(litifyDocsFileType != null) jsonMap.put('litify_docs__File_Type__c', litifyDocsFileType.toJson());
                if(litifyDocsPassword != null) jsonMap.put('litify_docs__Password__c', litifyDocsPassword.toJson());
                if(litifyDocsUniqueId != null) jsonMap.put('litify_docs__Unique_Id__c', litifyDocsUniqueId.toJson());
                return jsonMap;
            }

            public static Anonymous1ZX8R fromJson(Map<String, Object> jsonMap) {
                Anonymous1ZX8R obj = new Anonymous1ZX8R();
                if(jsonMap.containsKey('litify_docs__Expiration_Date__c')) {
                    obj.litifyDocsExpirationDate.setValue((String)jsonMap.get('litify_docs__Expiration_Date__c'));
                }
                if(jsonMap.containsKey('litify_docs__File_Size__c')) {
                    obj.litifyDocsFileSize.setValue((String)jsonMap.get('litify_docs__File_Size__c'));
                }
                if(jsonMap.containsKey('litify_docs__File_Type__c')) {
                    obj.litifyDocsFileType.setValue((String)jsonMap.get('litify_docs__File_Type__c'));
                }
                if(jsonMap.containsKey('litify_docs__Password__c')) {
                    obj.litifyDocsPassword.setValue((String)jsonMap.get('litify_docs__Password__c'));
                }
                if(jsonMap.containsKey('litify_docs__Unique_Id__c')) {
                    obj.litifyDocsUniqueId.setValue((String)jsonMap.get('litify_docs__Unique_Id__c'));
                }
                return obj;
            }
        }
        public List<DocrioModels.FileRecordObject> FileInfoRecords { get; set; }
        public Anonymous1ZX8R FileLinkRecord { get; set; }
        public ExternalLinkPostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(FileInfoRecords != null) jsonMap.put('FileInfoRecords', FileInfoRecords);
            if(FileLinkRecord != null) jsonMap.put('FileLinkRecord', FileLinkRecord);
            return jsonMap;
        }

        public static ExternalLinkPostRequest fromJson(Map<String, Object> jsonMap) {
            ExternalLinkPostRequest obj = new ExternalLinkPostRequest();
            if(jsonMap.containsKey('FileInfoRecords')) {
                obj.FileInfoRecords = (List<DocrioModels.FileRecordObject>)jsonMap.get('FileInfoRecords');
            }
            if(jsonMap.containsKey('FileLinkRecord')) {
                obj.FileLinkRecord = (Anonymous1ZX8R)jsonMap.get('FileLinkRecord');
            }
            return obj;
        }
    }
    public class ExternalLinkPostResponse {
        public class AnonymousG6VT9 {
            public String Id { get; set; }
            public DocrioField litifyDocsUniqueId { get; set; }
            public DocrioField litifyDocsPassword { get; set; }
            public DocrioField litifyDocsExpirationDate { get; set; }
            public AnonymousG6VT9() {
                this.litifyDocsUniqueId = new DocrioField('litify_docs__Unique_Id__c');
                this.litifyDocsPassword = new DocrioField('litify_docs__Password__c');
                this.litifyDocsExpirationDate = new DocrioField('litify_docs__Expiration_Date__c');
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(Id != null) jsonMap.put('Id', Id);
                if(litifyDocsUniqueId != null) jsonMap.put('litify_docs__Unique_Id__c', litifyDocsUniqueId.toJson());
                if(litifyDocsPassword != null) jsonMap.put('litify_docs__Password__c', litifyDocsPassword.toJson());
                if(litifyDocsExpirationDate != null) jsonMap.put('litify_docs__Expiration_Date__c', litifyDocsExpirationDate.toJson());
                return jsonMap;
            }

            public static AnonymousG6VT9 fromJson(Map<String, Object> jsonMap) {
                AnonymousG6VT9 obj = new AnonymousG6VT9();
                if(jsonMap.containsKey('Id')) {
                    obj.Id = (String)jsonMap.get('Id');
                }
                if(jsonMap.containsKey('litify_docs__Unique_Id__c')) {
                    obj.litifyDocsUniqueId.setValue((String)jsonMap.get('litify_docs__Unique_Id__c'));
                }
                if(jsonMap.containsKey('litify_docs__Password__c')) {
                    obj.litifyDocsPassword.setValue((String)jsonMap.get('litify_docs__Password__c'));
                }
                if(jsonMap.containsKey('litify_docs__Expiration_Date__c')) {
                    obj.litifyDocsExpirationDate.setValue((String)jsonMap.get('litify_docs__Expiration_Date__c'));
                }
                return obj;
            }
        }
        public String CreatedByName { get; set; }
        public String OrganizationName { get; set; }
        public List<AnonymousG6VT9> Records { get; set; }
        public ExternalLinkPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(CreatedByName != null) jsonMap.put('CreatedByName', CreatedByName);
            if(OrganizationName != null) jsonMap.put('OrganizationName', OrganizationName);
            if(Records != null) jsonMap.put('Records', Records);
            return jsonMap;
        }

        public static ExternalLinkPostResponse fromJson(Map<String, Object> jsonMap) {
            ExternalLinkPostResponse obj = new ExternalLinkPostResponse();
            if(jsonMap.containsKey('CreatedByName')) {
                obj.CreatedByName = (String)jsonMap.get('CreatedByName');
            }
            if(jsonMap.containsKey('OrganizationName')) {
                obj.OrganizationName = (String)jsonMap.get('OrganizationName');
            }
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<AnonymousG6VT9>)jsonMap.get('Records');
            }
            return obj;
        }
    }
    public class ExternalLinkDownloadResponse {
        public String FileId { get; set; }
        public ExternalLinkDownloadResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(FileId != null) jsonMap.put('FileId', FileId);
            return jsonMap;
        }

        public static ExternalLinkDownloadResponse fromJson(Map<String, Object> jsonMap) {
            ExternalLinkDownloadResponse obj = new ExternalLinkDownloadResponse();
            if(jsonMap.containsKey('FileId')) {
                obj.FileId = (String)jsonMap.get('FileId');
            }
            return obj;
        }
    }
    public class ExternalLinkPreviewResponse {
        public String SignedUrl { get; set; }
        public String Expires { get; set; }
        public ExternalLinkPreviewResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(SignedUrl != null) jsonMap.put('SignedUrl', SignedUrl);
            if(Expires != null) jsonMap.put('Expires', Expires);
            return jsonMap;
        }

        public static ExternalLinkPreviewResponse fromJson(Map<String, Object> jsonMap) {
            ExternalLinkPreviewResponse obj = new ExternalLinkPreviewResponse();
            if(jsonMap.containsKey('SignedUrl')) {
                obj.SignedUrl = (String)jsonMap.get('SignedUrl');
            }
            if(jsonMap.containsKey('Expires')) {
                obj.Expires = (String)jsonMap.get('Expires');
            }
            return obj;
        }
    }
    public class ExternalLinkGetResponse {
        public class AnonymousYDH7G {
            public class Anonymous5L93V {
                public List<Object> files { get; set; }
                public List<Object> folders { get; set; }
                public Anonymous5L93V() {
                }

                public Map<String, Object> toJson() {
                    Map<String, Object> jsonMap = new Map<String, Object>();
                    if(files != null) jsonMap.put('files', files);
                    if(folders != null) jsonMap.put('folders', folders);
                    return jsonMap;
                }

                public static Anonymous5L93V fromJson(Map<String, Object> jsonMap) {
                    Anonymous5L93V obj = new Anonymous5L93V();
                    if(jsonMap.containsKey('files')) {
                        obj.files = (List<Object>)jsonMap.get('files');
                    }
                    if(jsonMap.containsKey('folders')) {
                        obj.folders = (List<Object>)jsonMap.get('folders');
                    }
                    return obj;
                }
            }
            public Anonymous5L93V a1D52000001Thq9EAC { get; set; }
            public AnonymousYDH7G() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(a1D52000001Thq9EAC != null) jsonMap.put('a1D52000001Thq9EAC', a1D52000001Thq9EAC);
                return jsonMap;
            }

            public static AnonymousYDH7G fromJson(Map<String, Object> jsonMap) {
                AnonymousYDH7G obj = new AnonymousYDH7G();
                if(jsonMap.containsKey('a1D52000001Thq9EAC')) {
                    obj.a1D52000001Thq9EAC = (Anonymous5L93V)jsonMap.get('a1D52000001Thq9EAC');
                }
                return obj;
            }
        }
        public String Expires { get; set; }
        public String SharedBy { get; set; }
        public String OrgName { get; set; }
        public List<Object> Records { get; set; }
        public AnonymousYDH7G FolderReference { get; set; }
        public ExternalLinkGetResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Expires != null) jsonMap.put('Expires', Expires);
            if(SharedBy != null) jsonMap.put('SharedBy', SharedBy);
            if(OrgName != null) jsonMap.put('OrgName', OrgName);
            if(Records != null) jsonMap.put('Records', Records);
            if(FolderReference != null) jsonMap.put('FolderReference', FolderReference);
            return jsonMap;
        }

        public static ExternalLinkGetResponse fromJson(Map<String, Object> jsonMap) {
            ExternalLinkGetResponse obj = new ExternalLinkGetResponse();
            if(jsonMap.containsKey('Expires')) {
                obj.Expires = (String)jsonMap.get('Expires');
            }
            if(jsonMap.containsKey('SharedBy')) {
                obj.SharedBy = (String)jsonMap.get('SharedBy');
            }
            if(jsonMap.containsKey('OrgName')) {
                obj.OrgName = (String)jsonMap.get('OrgName');
            }
            if(jsonMap.containsKey('Records')) {
                obj.Records = (List<Object>)jsonMap.get('Records');
            }
            if(jsonMap.containsKey('FolderReference')) {
                obj.FolderReference = (AnonymousYDH7G)jsonMap.get('FolderReference');
            }
            return obj;
        }
    }
    public class ExternalLinkZipStatusResponse {
        public String ZipFileId { get; set; }
        public String Status { get; set; }
        public String SignedUrl { get; set; }
        public ExternalLinkZipStatusResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(ZipFileId != null) jsonMap.put('ZipFileId', ZipFileId);
            if(Status != null) jsonMap.put('Status', Status);
            if(SignedUrl != null) jsonMap.put('SignedUrl', SignedUrl);
            return jsonMap;
        }

        public static ExternalLinkZipStatusResponse fromJson(Map<String, Object> jsonMap) {
            ExternalLinkZipStatusResponse obj = new ExternalLinkZipStatusResponse();
            if(jsonMap.containsKey('ZipFileId')) {
                obj.ZipFileId = (String)jsonMap.get('ZipFileId');
            }
            if(jsonMap.containsKey('Status')) {
                obj.Status = (String)jsonMap.get('Status');
            }
            if(jsonMap.containsKey('SignedUrl')) {
                obj.SignedUrl = (String)jsonMap.get('SignedUrl');
            }
            return obj;
        }
    }
    public class ExternalLinkDeleteResponse {
        public List<String> Successes { get; set; }
        public List<String> Failures { get; set; }
        public ExternalLinkDeleteResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Successes != null) jsonMap.put('Successes', Successes);
            if(Failures != null) jsonMap.put('Failures', Failures);
            return jsonMap;
        }

        public static ExternalLinkDeleteResponse fromJson(Map<String, Object> jsonMap) {
            ExternalLinkDeleteResponse obj = new ExternalLinkDeleteResponse();
            if(jsonMap.containsKey('Successes')) {
                obj.Successes = (List<String>)jsonMap.get('Successes');
            }
            if(jsonMap.containsKey('Failures')) {
                obj.Failures = (List<String>)jsonMap.get('Failures');
            }
            return obj;
        }
    }
    public class ExternalLinkZipRequest {
        public class AnonymousYDSSO {
            public class Anonymous9HXS9 {
                public String a1D52000001Thq9EAC { get; set; }
                public Anonymous9HXS9() {
                }

                public Map<String, Object> toJson() {
                    Map<String, Object> jsonMap = new Map<String, Object>();
                    if(a1D52000001Thq9EAC != null) jsonMap.put('a1D52000001Thq9EAC', a1D52000001Thq9EAC);
                    return jsonMap;
                }

                public static Anonymous9HXS9 fromJson(Map<String, Object> jsonMap) {
                    Anonymous9HXS9 obj = new Anonymous9HXS9();
                    if(jsonMap.containsKey('a1D52000001Thq9EAC')) {
                        obj.a1D52000001Thq9EAC = (String)jsonMap.get('a1D52000001Thq9EAC');
                    }
                    return obj;
                }
            }
            public List<String> files { get; set; }
            public Anonymous9HXS9 filePathReference { get; set; }
            public AnonymousYDSSO() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(files != null) jsonMap.put('files', files);
                if(filePathReference != null) jsonMap.put('filePathReference', filePathReference);
                return jsonMap;
            }

            public static AnonymousYDSSO fromJson(Map<String, Object> jsonMap) {
                AnonymousYDSSO obj = new AnonymousYDSSO();
                if(jsonMap.containsKey('files')) {
                    obj.files = (List<String>)jsonMap.get('files');
                }
                if(jsonMap.containsKey('filePathReference')) {
                    obj.filePathReference = (Anonymous9HXS9)jsonMap.get('filePathReference');
                }
                return obj;
            }
        }
        public List<String> FileIds { get; set; }
        public AnonymousYDSSO FileIdsWithFolderPath { get; set; }
        public ExternalLinkZipRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(FileIds != null) jsonMap.put('FileIds', FileIds);
            if(FileIdsWithFolderPath != null) jsonMap.put('FileIdsWithFolderPath', FileIdsWithFolderPath);
            return jsonMap;
        }

        public static ExternalLinkZipRequest fromJson(Map<String, Object> jsonMap) {
            ExternalLinkZipRequest obj = new ExternalLinkZipRequest();
            if(jsonMap.containsKey('FileIds')) {
                obj.FileIds = (List<String>)jsonMap.get('FileIds');
            }
            if(jsonMap.containsKey('FileIdsWithFolderPath')) {
                obj.FileIdsWithFolderPath = (AnonymousYDSSO)jsonMap.get('FileIdsWithFolderPath');
            }
            return obj;
        }
    }
    public class ExternalLinkZipResponse {
        public String ZipFileId { get; set; }
        public String Status { get; set; }
        public ExternalLinkZipResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(ZipFileId != null) jsonMap.put('ZipFileId', ZipFileId);
            if(Status != null) jsonMap.put('Status', Status);
            return jsonMap;
        }

        public static ExternalLinkZipResponse fromJson(Map<String, Object> jsonMap) {
            ExternalLinkZipResponse obj = new ExternalLinkZipResponse();
            if(jsonMap.containsKey('ZipFileId')) {
                obj.ZipFileId = (String)jsonMap.get('ZipFileId');
            }
            if(jsonMap.containsKey('Status')) {
                obj.Status = (String)jsonMap.get('Status');
            }
            return obj;
        }
    }
    public class ArchivePostRequest {
        public Object FileInfoIds { get; set; }
        public Object RecordIds { get; set; }
        public ArchivePostRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(FileInfoIds != null) jsonMap.put('FileInfoIds', FileInfoIds);
            if(RecordIds != null) jsonMap.put('RecordIds', RecordIds);
            return jsonMap;
        }

        public static ArchivePostRequest fromJson(Map<String, Object> jsonMap) {
            ArchivePostRequest obj = new ArchivePostRequest();
            if(jsonMap.containsKey('FileInfoIds')) {
                obj.FileInfoIds = (Object)jsonMap.get('FileInfoIds');
            }
            if(jsonMap.containsKey('RecordIds')) {
                obj.RecordIds = (Object)jsonMap.get('RecordIds');
            }
            return obj;
        }
    }
    public class ArchivePostResponse {
        public String externalJobId { get; set; }
        public ArchivePostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(externalJobId != null) jsonMap.put('externalJobId', externalJobId);
            return jsonMap;
        }

        public static ArchivePostResponse fromJson(Map<String, Object> jsonMap) {
            ArchivePostResponse obj = new ArchivePostResponse();
            if(jsonMap.containsKey('externalJobId')) {
                obj.externalJobId = (String)jsonMap.get('externalJobId');
            }
            return obj;
        }
    }
    public class ArchiveStatusGetResponse {
        public String externalJobId { get; set; }
        public String status { get; set; }
        public String results { get; set; }
        public ArchiveStatusGetResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(externalJobId != null) jsonMap.put('externalJobId', externalJobId);
            if(status != null) jsonMap.put('status', status);
            if(results != null) jsonMap.put('results', results);
            return jsonMap;
        }

        public static ArchiveStatusGetResponse fromJson(Map<String, Object> jsonMap) {
            ArchiveStatusGetResponse obj = new ArchiveStatusGetResponse();
            if(jsonMap.containsKey('externalJobId')) {
                obj.externalJobId = (String)jsonMap.get('externalJobId');
            }
            if(jsonMap.containsKey('status')) {
                obj.status = (String)jsonMap.get('status');
            }
            if(jsonMap.containsKey('results')) {
                obj.results = (String)jsonMap.get('results');
            }
            return obj;
        }
    }
    public class FilesShareRequest {
        public List<String> Ids { get; set; }
        public Boolean share { get; set; }
        public FilesShareRequest() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Ids != null) jsonMap.put('Ids', Ids);
            if(share != null) jsonMap.put('share', share);
            return jsonMap;
        }

        public static FilesShareRequest fromJson(Map<String, Object> jsonMap) {
            FilesShareRequest obj = new FilesShareRequest();
            if(jsonMap.containsKey('Ids')) {
                obj.Ids = (List<String>)jsonMap.get('Ids');
            }
            if(jsonMap.containsKey('share')) {
                obj.share = (Boolean)jsonMap.get('share');
            }
            return obj;
        }
    }
    public class FilesRestoreResponse {
        public List<String> Successes { get; set; }
        public List<String> Failures { get; set; }
        public FilesRestoreResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Successes != null) jsonMap.put('Successes', Successes);
            if(Failures != null) jsonMap.put('Failures', Failures);
            return jsonMap;
        }

        public static FilesRestoreResponse fromJson(Map<String, Object> jsonMap) {
            FilesRestoreResponse obj = new FilesRestoreResponse();
            if(jsonMap.containsKey('Successes')) {
                obj.Successes = (List<String>)jsonMap.get('Successes');
            }
            if(jsonMap.containsKey('Failures')) {
                obj.Failures = (List<String>)jsonMap.get('Failures');
            }
            return obj;
        }
    }
    public class TextContentPostResponse {
        public String SignedUrl { get; set; }
        public TextContentPostResponse() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(SignedUrl != null) jsonMap.put('SignedUrl', SignedUrl);
            return jsonMap;
        }

        public static TextContentPostResponse fromJson(Map<String, Object> jsonMap) {
            TextContentPostResponse obj = new TextContentPostResponse();
            if(jsonMap.containsKey('SignedUrl')) {
                obj.SignedUrl = (String)jsonMap.get('SignedUrl');
            }
            return obj;
        }
    }
    public class HistoryRecordObject {
        public String Id { get; set; }
        public String OwnerId { get; set; }
        public Boolean IsDeleted { get; set; }
        public String Name { get; set; }
        public String CreatedDate { get; set; }
        public String CreatedById { get; set; }
        public String LastModifiedDate { get; set; }
        public String LastModifiedById { get; set; }
        public String SystemModstamp { get; set; }
        public String LastViewedDate { get; set; }
        public String LastReferencedDate { get; set; }
        public DocrioField litifyDocsFileInfo { get; set; }
        public DocrioField litifyDocsFileInfoCUser { get; set; }
        public DocrioField litifyDocsFileInfoCDate { get; set; }
        public DocrioField litifyDocsFileInfoCAction { get; set; }
        public HistoryRecordObject() {
            this.litifyDocsFileInfo = new DocrioField('litify_docs__File_Info__c');
            this.litifyDocsFileInfoCUser = new DocrioField('litify_docs__File_Info__c__User__c');
            this.litifyDocsFileInfoCDate = new DocrioField('litify_docs__File_Info__c__Date__c');
            this.litifyDocsFileInfoCAction = new DocrioField('litify_docs__File_Info__c__Action__c');
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Id != null) jsonMap.put('Id', Id);
            if(OwnerId != null) jsonMap.put('OwnerId', OwnerId);
            if(IsDeleted != null) jsonMap.put('IsDeleted', IsDeleted);
            if(Name != null) jsonMap.put('Name', Name);
            if(CreatedDate != null) jsonMap.put('CreatedDate', CreatedDate);
            if(CreatedById != null) jsonMap.put('CreatedById', CreatedById);
            if(LastModifiedDate != null) jsonMap.put('LastModifiedDate', LastModifiedDate);
            if(LastModifiedById != null) jsonMap.put('LastModifiedById', LastModifiedById);
            if(SystemModstamp != null) jsonMap.put('SystemModstamp', SystemModstamp);
            if(LastViewedDate != null) jsonMap.put('LastViewedDate', LastViewedDate);
            if(LastReferencedDate != null) jsonMap.put('LastReferencedDate', LastReferencedDate);
            if(litifyDocsFileInfo != null) jsonMap.put('litify_docs__File_Info__c', litifyDocsFileInfo.toJson());
            if(litifyDocsFileInfoCUser != null) jsonMap.put('litify_docs__File_Info__c__User__c', litifyDocsFileInfoCUser.toJson());
            if(litifyDocsFileInfoCDate != null) jsonMap.put('litify_docs__File_Info__c__Date__c', litifyDocsFileInfoCDate.toJson());
            if(litifyDocsFileInfoCAction != null) jsonMap.put('litify_docs__File_Info__c__Action__c', litifyDocsFileInfoCAction.toJson());
            return jsonMap;
        }

        public static HistoryRecordObject fromJson(Map<String, Object> jsonMap) {
            HistoryRecordObject obj = new HistoryRecordObject();
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            if(jsonMap.containsKey('OwnerId')) {
                obj.OwnerId = (String)jsonMap.get('OwnerId');
            }
            if(jsonMap.containsKey('IsDeleted')) {
                obj.IsDeleted = (Boolean)jsonMap.get('IsDeleted');
            }
            if(jsonMap.containsKey('Name')) {
                obj.Name = (String)jsonMap.get('Name');
            }
            if(jsonMap.containsKey('CreatedDate')) {
                obj.CreatedDate = (String)jsonMap.get('CreatedDate');
            }
            if(jsonMap.containsKey('CreatedById')) {
                obj.CreatedById = (String)jsonMap.get('CreatedById');
            }
            if(jsonMap.containsKey('LastModifiedDate')) {
                obj.LastModifiedDate = (String)jsonMap.get('LastModifiedDate');
            }
            if(jsonMap.containsKey('LastModifiedById')) {
                obj.LastModifiedById = (String)jsonMap.get('LastModifiedById');
            }
            if(jsonMap.containsKey('SystemModstamp')) {
                obj.SystemModstamp = (String)jsonMap.get('SystemModstamp');
            }
            if(jsonMap.containsKey('LastViewedDate')) {
                obj.LastViewedDate = (String)jsonMap.get('LastViewedDate');
            }
            if(jsonMap.containsKey('LastReferencedDate')) {
                obj.LastReferencedDate = (String)jsonMap.get('LastReferencedDate');
            }
            if(jsonMap.containsKey('litify_docs__File_Info__c')) {
                obj.litifyDocsFileInfo.setValue((String)jsonMap.get('litify_docs__File_Info__c'));
            }
            if(jsonMap.containsKey('litify_docs__File_Info__c__User__c')) {
                obj.litifyDocsFileInfoCUser.setValue((String)jsonMap.get('litify_docs__File_Info__c__User__c'));
            }
            if(jsonMap.containsKey('litify_docs__File_Info__c__Date__c')) {
                obj.litifyDocsFileInfoCDate.setValue((String)jsonMap.get('litify_docs__File_Info__c__Date__c'));
            }
            if(jsonMap.containsKey('litify_docs__File_Info__c__Action__c')) {
                obj.litifyDocsFileInfoCAction.setValue((String)jsonMap.get('litify_docs__File_Info__c__Action__c'));
            }
            return obj;
        }
    }
    public class FolderStructureObject {
        public class AnonymousP4A3L {
            public String name { get; set; }
            public List<Map<String, Object>> subfolders { get; set; }
            public AnonymousP4A3L() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(name != null) jsonMap.put('name', name);
                if(subfolders != null) jsonMap.put('subfolders', subfolders);
                return jsonMap;
            }

            public static AnonymousP4A3L fromJson(Map<String, Object> jsonMap) {
                AnonymousP4A3L obj = new AnonymousP4A3L();
                if(jsonMap.containsKey('name')) {
                    obj.name = (String)jsonMap.get('name');
                }
                if(jsonMap.containsKey('subfolders')) {
                    obj.subfolders = (List<Map<String, Object>>)jsonMap.get('subfolders');
                }
                return obj;
            }
        }
        public String name { get; set; }
        public List<AnonymousP4A3L> subfolders { get; set; }
        public FolderStructureObject() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(name != null) jsonMap.put('name', name);
            if(subfolders != null) jsonMap.put('subfolders', subfolders);
            return jsonMap;
        }

        public static FolderStructureObject fromJson(Map<String, Object> jsonMap) {
            FolderStructureObject obj = new FolderStructureObject();
            if(jsonMap.containsKey('name')) {
                obj.name = (String)jsonMap.get('name');
            }
            if(jsonMap.containsKey('subfolders')) {
                obj.subfolders = (List<AnonymousP4A3L>)jsonMap.get('subfolders');
            }
            return obj;
        }
    }
    public class NextBatchObject {
        public String OffsetId { get; set; }
        public String OffsetValue { get; set; }
        public NextBatchObject() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(OffsetId != null) jsonMap.put('OffsetId', OffsetId);
            if(OffsetValue != null) jsonMap.put('OffsetValue', OffsetValue);
            return jsonMap;
        }

        public static NextBatchObject fromJson(Map<String, Object> jsonMap) {
            NextBatchObject obj = new NextBatchObject();
            if(jsonMap.containsKey('OffsetId')) {
                obj.OffsetId = (String)jsonMap.get('OffsetId');
            }
            if(jsonMap.containsKey('OffsetValue')) {
                obj.OffsetValue = (String)jsonMap.get('OffsetValue');
            }
            return obj;
        }
    }
    public class FileRecordObject {
        public class AnonymousTZNUW {
            public String type { get; set; }
            public String url { get; set; }
            public AnonymousTZNUW() {
            }

            public Map<String, Object> toJson() {
                Map<String, Object> jsonMap = new Map<String, Object>();
                if(type != null) jsonMap.put('type', type);
                if(url != null) jsonMap.put('url', url);
                return jsonMap;
            }

            public static AnonymousTZNUW fromJson(Map<String, Object> jsonMap) {
                AnonymousTZNUW obj = new AnonymousTZNUW();
                if(jsonMap.containsKey('type')) {
                    obj.type = (String)jsonMap.get('type');
                }
                if(jsonMap.containsKey('url')) {
                    obj.url = (String)jsonMap.get('url');
                }
                return obj;
            }
        }
        public AnonymousTZNUW attributes { get; set; }
        public String Id { get; set; }
        public String OwnerId { get; set; }
        public Boolean IsDeleted { get; set; }
        public String Name { get; set; }
        public String CreatedDate { get; set; }
        public String CreatedById { get; set; }
        public String LastModifiedDate { get; set; }
        public String LastModifiedById { get; set; }
        public String LastReferencedDate { get; set; }
        public String LastViewedDate { get; set; }
        public String SystemModstamp { get; set; }
        public DocrioField litifyDocsAuthor { get; set; }
        public DocrioField litifyDocsDescription { get; set; }
        public DocrioField litifyDocsExternalFilePath { get; set; }
        public DocrioField litifyDocsExternalId { get; set; }
        public DocrioField litifyDocsFolderPath { get; set; }
        public DocrioField litifyDocsFrom { get; set; }
        public DocrioField litifyDocsTo { get; set; }
        public DocrioField litifyDocsLatestVersion { get; set; }
        public DocrioField litifyDocsComplete { get; set; }
        public DocrioField litifyDocsFileLink { get; set; }
        public DocrioField litifyDocsRelatedToApiName { get; set; }
        public DocrioField litifyDocsFileType { get; set; }
        public DocrioField litifyDocsFileSize { get; set; }
        public DocrioField litifyDocsRelatedTo { get; set; }
        public List<String> Duplicates { get; set; }
        // Checksum calculated based on file content
        public String Checksum { get; set; }
        public FileRecordObject() {
            this.litifyDocsAuthor = new DocrioField('litify_docs__Author__c');
            this.litifyDocsDescription = new DocrioField('litify_docs__Description__c');
            this.litifyDocsExternalFilePath = new DocrioField('litify_docs__External_File_Path__c');
            this.litifyDocsExternalId = new DocrioField('litify_docs__External_ID__c');
            this.litifyDocsFolderPath = new DocrioField('litify_docs__Folder_Path__c');
            this.litifyDocsFrom = new DocrioField('litify_docs__From__c');
            this.litifyDocsTo = new DocrioField('litify_docs__To__c');
            this.litifyDocsLatestVersion = new DocrioField('litify_docs__Latest_Version__c');
            this.litifyDocsComplete = new DocrioField('litify_docs__Complete__c');
            this.litifyDocsFileLink = new DocrioField('litify_docs__File_Link__c');
            this.litifyDocsRelatedToApiName = new DocrioField('litify_docs__Related_To_Api_Name__c');
            this.litifyDocsFileType = new DocrioField('litify_docs__File_Type__c');
            this.litifyDocsFileSize = new DocrioField('litify_docs__File_Size__c');
            this.litifyDocsRelatedTo = new DocrioField('litify_docs__Related_To__c');
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(attributes != null) jsonMap.put('attributes', attributes);
            if(Id != null) jsonMap.put('Id', Id);
            if(OwnerId != null) jsonMap.put('OwnerId', OwnerId);
            if(IsDeleted != null) jsonMap.put('IsDeleted', IsDeleted);
            if(Name != null) jsonMap.put('Name', Name);
            if(CreatedDate != null) jsonMap.put('CreatedDate', CreatedDate);
            if(CreatedById != null) jsonMap.put('CreatedById', CreatedById);
            if(LastModifiedDate != null) jsonMap.put('LastModifiedDate', LastModifiedDate);
            if(LastModifiedById != null) jsonMap.put('LastModifiedById', LastModifiedById);
            if(LastReferencedDate != null) jsonMap.put('LastReferencedDate', LastReferencedDate);
            if(LastViewedDate != null) jsonMap.put('LastViewedDate', LastViewedDate);
            if(SystemModstamp != null) jsonMap.put('SystemModstamp', SystemModstamp);
            if(litifyDocsAuthor != null) jsonMap.put('litify_docs__Author__c', litifyDocsAuthor.toJson());
            if(litifyDocsDescription != null) jsonMap.put('litify_docs__Description__c', litifyDocsDescription.toJson());
            if(litifyDocsExternalFilePath != null) jsonMap.put('litify_docs__External_File_Path__c', litifyDocsExternalFilePath.toJson());
            if(litifyDocsExternalId != null) jsonMap.put('litify_docs__External_ID__c', litifyDocsExternalId.toJson());
            if(litifyDocsFolderPath != null) jsonMap.put('litify_docs__Folder_Path__c', litifyDocsFolderPath.toJson());
            if(litifyDocsFrom != null) jsonMap.put('litify_docs__From__c', litifyDocsFrom.toJson());
            if(litifyDocsTo != null) jsonMap.put('litify_docs__To__c', litifyDocsTo.toJson());
            if(litifyDocsLatestVersion != null) jsonMap.put('litify_docs__Latest_Version__c', litifyDocsLatestVersion.toJson());
            if(litifyDocsComplete != null) jsonMap.put('litify_docs__Complete__c', litifyDocsComplete.toJson());
            if(litifyDocsFileLink != null) jsonMap.put('litify_docs__File_Link__c', litifyDocsFileLink.toJson());
            if(litifyDocsRelatedToApiName != null) jsonMap.put('litify_docs__Related_To_Api_Name__c', litifyDocsRelatedToApiName.toJson());
            if(litifyDocsFileType != null) jsonMap.put('litify_docs__File_Type__c', litifyDocsFileType.toJson());
            if(litifyDocsFileSize != null) jsonMap.put('litify_docs__File_Size__c', litifyDocsFileSize.toJson());
            if(litifyDocsRelatedTo != null) jsonMap.put('litify_docs__Related_To__c', litifyDocsRelatedTo.toJson());
            if(Duplicates != null) jsonMap.put('Duplicates', Duplicates);
            if(Checksum != null) jsonMap.put('Checksum', Checksum);
            return jsonMap;
        }

        public static FileRecordObject fromJson(Map<String, Object> jsonMap) {
            FileRecordObject obj = new FileRecordObject();
            if(jsonMap.containsKey('attributes')) {
                obj.attributes = (AnonymousTZNUW)jsonMap.get('attributes');
            }
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            if(jsonMap.containsKey('OwnerId')) {
                obj.OwnerId = (String)jsonMap.get('OwnerId');
            }
            if(jsonMap.containsKey('IsDeleted')) {
                obj.IsDeleted = (Boolean)jsonMap.get('IsDeleted');
            }
            if(jsonMap.containsKey('Name')) {
                obj.Name = (String)jsonMap.get('Name');
            }
            if(jsonMap.containsKey('CreatedDate')) {
                obj.CreatedDate = (String)jsonMap.get('CreatedDate');
            }
            if(jsonMap.containsKey('CreatedById')) {
                obj.CreatedById = (String)jsonMap.get('CreatedById');
            }
            if(jsonMap.containsKey('LastModifiedDate')) {
                obj.LastModifiedDate = (String)jsonMap.get('LastModifiedDate');
            }
            if(jsonMap.containsKey('LastModifiedById')) {
                obj.LastModifiedById = (String)jsonMap.get('LastModifiedById');
            }
            if(jsonMap.containsKey('LastReferencedDate')) {
                obj.LastReferencedDate = (String)jsonMap.get('LastReferencedDate');
            }
            if(jsonMap.containsKey('LastViewedDate')) {
                obj.LastViewedDate = (String)jsonMap.get('LastViewedDate');
            }
            if(jsonMap.containsKey('SystemModstamp')) {
                obj.SystemModstamp = (String)jsonMap.get('SystemModstamp');
            }
            if(jsonMap.containsKey('litify_docs__Author__c')) {
                obj.litifyDocsAuthor.setValue((String)jsonMap.get('litify_docs__Author__c'));
            }
            if(jsonMap.containsKey('litify_docs__Description__c')) {
                obj.litifyDocsDescription.setValue((String)jsonMap.get('litify_docs__Description__c'));
            }
            if(jsonMap.containsKey('litify_docs__External_File_Path__c')) {
                obj.litifyDocsExternalFilePath.setValue((String)jsonMap.get('litify_docs__External_File_Path__c'));
            }
            if(jsonMap.containsKey('litify_docs__External_ID__c')) {
                obj.litifyDocsExternalId.setValue((String)jsonMap.get('litify_docs__External_ID__c'));
            }
            if(jsonMap.containsKey('litify_docs__Folder_Path__c')) {
                obj.litifyDocsFolderPath.setValue((String)jsonMap.get('litify_docs__Folder_Path__c'));
            }
            if(jsonMap.containsKey('litify_docs__From__c')) {
                obj.litifyDocsFrom.setValue((String)jsonMap.get('litify_docs__From__c'));
            }
            if(jsonMap.containsKey('litify_docs__To__c')) {
                obj.litifyDocsTo.setValue((String)jsonMap.get('litify_docs__To__c'));
            }
            if(jsonMap.containsKey('litify_docs__Latest_Version__c')) {
                obj.litifyDocsLatestVersion.setValue((String)jsonMap.get('litify_docs__Latest_Version__c'));
            }
            if(jsonMap.containsKey('litify_docs__Complete__c')) {
                obj.litifyDocsComplete.setValue((String)jsonMap.get('litify_docs__Complete__c'));
            }
            if(jsonMap.containsKey('litify_docs__File_Link__c')) {
                obj.litifyDocsFileLink.setValue((String)jsonMap.get('litify_docs__File_Link__c'));
            }
            if(jsonMap.containsKey('litify_docs__Related_To_Api_Name__c')) {
                obj.litifyDocsRelatedToApiName.setValue((String)jsonMap.get('litify_docs__Related_To_Api_Name__c'));
            }
            if(jsonMap.containsKey('litify_docs__File_Type__c')) {
                obj.litifyDocsFileType.setValue((String)jsonMap.get('litify_docs__File_Type__c'));
            }
            if(jsonMap.containsKey('litify_docs__File_Size__c')) {
                obj.litifyDocsFileSize.setValue((String)jsonMap.get('litify_docs__File_Size__c'));
            }
            if(jsonMap.containsKey('litify_docs__Related_To__c')) {
                obj.litifyDocsRelatedTo.setValue((String)jsonMap.get('litify_docs__Related_To__c'));
            }
            if(jsonMap.containsKey('Duplicates')) {
                obj.Duplicates = (List<String>)jsonMap.get('Duplicates');
            }
            if(jsonMap.containsKey('Checksum')) {
                obj.Checksum = (String)jsonMap.get('Checksum');
            }
            return obj;
        }
    }
    public class MultipartFileRecordObject {
        public String Id { get; set; }
        public String OwnerId { get; set; }
        public Boolean IsDeleted { get; set; }
        public String Name { get; set; }
        public String CreatedDate { get; set; }
        public String CreatedById { get; set; }
        public String LastModifiedDate { get; set; }
        public String LastModifiedById { get; set; }
        public String SystemModstamp { get; set; }
        public DocrioField litifyDocsComplete { get; set; }
        public DocrioField litifyDocsFileLink { get; set; }
        public DocrioField litifyDocsFileType { get; set; }
        public DocrioField litifyDocsFolderPathFirst255 { get; set; }
        public DocrioField litifyDocsFolderPathLast255 { get; set; }
        public DocrioField litifyDocsFolderPath { get; set; }
        public DocrioField litifyDocsLatestVersionFormula { get; set; }
        public DocrioField litifyDocsOcrCompatible { get; set; }
        public DocrioField litifyDocsRelatedToApiName { get; set; }
        public DocrioField litifyDocsRelatedTo { get; set; }
        public DocrioField litifyDocsLatestVersion { get; set; }
        public DocrioField litifyDocsUpdatedBy { get; set; }
        public DocrioField litifyDocsUpdatedOn { get; set; }
        public DocrioField litifyDocsUpdatedByName { get; set; }
        public DocrioField litifyDocsDelete { get; set; }
        public DocrioField litifyDocsHasAttachmentsLegacy { get; set; }
        public DocrioField litifyDocsFileSize { get; set; }
        public DocrioField litifyDocsSource { get; set; }
        public DocrioField litifyDocsVersionId { get; set; }
        public List<String> Duplicates { get; set; }
        // Checksum calculated based on file content
        public String Checksum { get; set; }
        public MultipartFileRecordObject() {
            this.litifyDocsComplete = new DocrioField('litify_docs__Complete__c');
            this.litifyDocsFileLink = new DocrioField('litify_docs__File_Link__c');
            this.litifyDocsFileType = new DocrioField('litify_docs__File_Type__c');
            this.litifyDocsFolderPathFirst255 = new DocrioField('litify_docs__Folder_Path_First_255__c');
            this.litifyDocsFolderPathLast255 = new DocrioField('litify_docs__Folder_Path_Last_255__c');
            this.litifyDocsFolderPath = new DocrioField('litify_docs__Folder_Path__c');
            this.litifyDocsLatestVersionFormula = new DocrioField('litify_docs__Latest_Version_Formula__c');
            this.litifyDocsOcrCompatible = new DocrioField('litify_docs__OCR_Compatible__c');
            this.litifyDocsRelatedToApiName = new DocrioField('litify_docs__Related_To_Api_Name__c');
            this.litifyDocsRelatedTo = new DocrioField('litify_docs__Related_To__c');
            this.litifyDocsLatestVersion = new DocrioField('litify_docs__Latest_Version__c');
            this.litifyDocsUpdatedBy = new DocrioField('litify_docs__Updated_By__c');
            this.litifyDocsUpdatedOn = new DocrioField('litify_docs__Updated_On__c');
            this.litifyDocsUpdatedByName = new DocrioField('litify_docs__Updated_By_Name__c');
            this.litifyDocsDelete = new DocrioField('litify_docs__Delete__c');
            this.litifyDocsHasAttachmentsLegacy = new DocrioField('litify_docs__Has_Attachments_Legacy__c');
            this.litifyDocsFileSize = new DocrioField('litify_docs__File_Size__c');
            this.litifyDocsSource = new DocrioField('litify_docs__Source__c');
            this.litifyDocsVersionId = new DocrioField('litify_docs__Version_Id__c');
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(Id != null) jsonMap.put('Id', Id);
            if(OwnerId != null) jsonMap.put('OwnerId', OwnerId);
            if(IsDeleted != null) jsonMap.put('IsDeleted', IsDeleted);
            if(Name != null) jsonMap.put('Name', Name);
            if(CreatedDate != null) jsonMap.put('CreatedDate', CreatedDate);
            if(CreatedById != null) jsonMap.put('CreatedById', CreatedById);
            if(LastModifiedDate != null) jsonMap.put('LastModifiedDate', LastModifiedDate);
            if(LastModifiedById != null) jsonMap.put('LastModifiedById', LastModifiedById);
            if(SystemModstamp != null) jsonMap.put('SystemModstamp', SystemModstamp);
            if(litifyDocsComplete != null) jsonMap.put('litify_docs__Complete__c', litifyDocsComplete.toJson());
            if(litifyDocsFileLink != null) jsonMap.put('litify_docs__File_Link__c', litifyDocsFileLink.toJson());
            if(litifyDocsFileType != null) jsonMap.put('litify_docs__File_Type__c', litifyDocsFileType.toJson());
            if(litifyDocsFolderPathFirst255 != null) jsonMap.put('litify_docs__Folder_Path_First_255__c', litifyDocsFolderPathFirst255.toJson());
            if(litifyDocsFolderPathLast255 != null) jsonMap.put('litify_docs__Folder_Path_Last_255__c', litifyDocsFolderPathLast255.toJson());
            if(litifyDocsFolderPath != null) jsonMap.put('litify_docs__Folder_Path__c', litifyDocsFolderPath.toJson());
            if(litifyDocsLatestVersionFormula != null) jsonMap.put('litify_docs__Latest_Version_Formula__c', litifyDocsLatestVersionFormula.toJson());
            if(litifyDocsOcrCompatible != null) jsonMap.put('litify_docs__OCR_Compatible__c', litifyDocsOcrCompatible.toJson());
            if(litifyDocsRelatedToApiName != null) jsonMap.put('litify_docs__Related_To_Api_Name__c', litifyDocsRelatedToApiName.toJson());
            if(litifyDocsRelatedTo != null) jsonMap.put('litify_docs__Related_To__c', litifyDocsRelatedTo.toJson());
            if(litifyDocsLatestVersion != null) jsonMap.put('litify_docs__Latest_Version__c', litifyDocsLatestVersion.toJson());
            if(litifyDocsUpdatedBy != null) jsonMap.put('litify_docs__Updated_By__c', litifyDocsUpdatedBy.toJson());
            if(litifyDocsUpdatedOn != null) jsonMap.put('litify_docs__Updated_On__c', litifyDocsUpdatedOn.toJson());
            if(litifyDocsUpdatedByName != null) jsonMap.put('litify_docs__Updated_By_Name__c', litifyDocsUpdatedByName.toJson());
            if(litifyDocsDelete != null) jsonMap.put('litify_docs__Delete__c', litifyDocsDelete.toJson());
            if(litifyDocsHasAttachmentsLegacy != null) jsonMap.put('litify_docs__Has_Attachments_Legacy__c', litifyDocsHasAttachmentsLegacy.toJson());
            if(litifyDocsFileSize != null) jsonMap.put('litify_docs__File_Size__c', litifyDocsFileSize.toJson());
            if(litifyDocsSource != null) jsonMap.put('litify_docs__Source__c', litifyDocsSource.toJson());
            if(litifyDocsVersionId != null) jsonMap.put('litify_docs__Version_Id__c', litifyDocsVersionId.toJson());
            if(Duplicates != null) jsonMap.put('Duplicates', Duplicates);
            if(Checksum != null) jsonMap.put('Checksum', Checksum);
            return jsonMap;
        }

        public static MultipartFileRecordObject fromJson(Map<String, Object> jsonMap) {
            MultipartFileRecordObject obj = new MultipartFileRecordObject();
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            if(jsonMap.containsKey('OwnerId')) {
                obj.OwnerId = (String)jsonMap.get('OwnerId');
            }
            if(jsonMap.containsKey('IsDeleted')) {
                obj.IsDeleted = (Boolean)jsonMap.get('IsDeleted');
            }
            if(jsonMap.containsKey('Name')) {
                obj.Name = (String)jsonMap.get('Name');
            }
            if(jsonMap.containsKey('CreatedDate')) {
                obj.CreatedDate = (String)jsonMap.get('CreatedDate');
            }
            if(jsonMap.containsKey('CreatedById')) {
                obj.CreatedById = (String)jsonMap.get('CreatedById');
            }
            if(jsonMap.containsKey('LastModifiedDate')) {
                obj.LastModifiedDate = (String)jsonMap.get('LastModifiedDate');
            }
            if(jsonMap.containsKey('LastModifiedById')) {
                obj.LastModifiedById = (String)jsonMap.get('LastModifiedById');
            }
            if(jsonMap.containsKey('SystemModstamp')) {
                obj.SystemModstamp = (String)jsonMap.get('SystemModstamp');
            }
            if(jsonMap.containsKey('litify_docs__Complete__c')) {
                obj.litifyDocsComplete.setValue((String)jsonMap.get('litify_docs__Complete__c'));
            }
            if(jsonMap.containsKey('litify_docs__File_Link__c')) {
                obj.litifyDocsFileLink.setValue((String)jsonMap.get('litify_docs__File_Link__c'));
            }
            if(jsonMap.containsKey('litify_docs__File_Type__c')) {
                obj.litifyDocsFileType.setValue((String)jsonMap.get('litify_docs__File_Type__c'));
            }
            if(jsonMap.containsKey('litify_docs__Folder_Path_First_255__c')) {
                obj.litifyDocsFolderPathFirst255.setValue((String)jsonMap.get('litify_docs__Folder_Path_First_255__c'));
            }
            if(jsonMap.containsKey('litify_docs__Folder_Path_Last_255__c')) {
                obj.litifyDocsFolderPathLast255.setValue((String)jsonMap.get('litify_docs__Folder_Path_Last_255__c'));
            }
            if(jsonMap.containsKey('litify_docs__Folder_Path__c')) {
                obj.litifyDocsFolderPath.setValue((String)jsonMap.get('litify_docs__Folder_Path__c'));
            }
            if(jsonMap.containsKey('litify_docs__Latest_Version_Formula__c')) {
                obj.litifyDocsLatestVersionFormula.setValue((String)jsonMap.get('litify_docs__Latest_Version_Formula__c'));
            }
            if(jsonMap.containsKey('litify_docs__OCR_Compatible__c')) {
                obj.litifyDocsOcrCompatible.setValue((String)jsonMap.get('litify_docs__OCR_Compatible__c'));
            }
            if(jsonMap.containsKey('litify_docs__Related_To_Api_Name__c')) {
                obj.litifyDocsRelatedToApiName.setValue((String)jsonMap.get('litify_docs__Related_To_Api_Name__c'));
            }
            if(jsonMap.containsKey('litify_docs__Related_To__c')) {
                obj.litifyDocsRelatedTo.setValue((String)jsonMap.get('litify_docs__Related_To__c'));
            }
            if(jsonMap.containsKey('litify_docs__Latest_Version__c')) {
                obj.litifyDocsLatestVersion.setValue((String)jsonMap.get('litify_docs__Latest_Version__c'));
            }
            if(jsonMap.containsKey('litify_docs__Updated_By__c')) {
                obj.litifyDocsUpdatedBy.setValue((String)jsonMap.get('litify_docs__Updated_By__c'));
            }
            if(jsonMap.containsKey('litify_docs__Updated_On__c')) {
                obj.litifyDocsUpdatedOn.setValue((String)jsonMap.get('litify_docs__Updated_On__c'));
            }
            if(jsonMap.containsKey('litify_docs__Updated_By_Name__c')) {
                obj.litifyDocsUpdatedByName.setValue((String)jsonMap.get('litify_docs__Updated_By_Name__c'));
            }
            if(jsonMap.containsKey('litify_docs__Delete__c')) {
                obj.litifyDocsDelete.setValue((String)jsonMap.get('litify_docs__Delete__c'));
            }
            if(jsonMap.containsKey('litify_docs__Has_Attachments_Legacy__c')) {
                obj.litifyDocsHasAttachmentsLegacy.setValue((String)jsonMap.get('litify_docs__Has_Attachments_Legacy__c'));
            }
            if(jsonMap.containsKey('litify_docs__File_Size__c')) {
                obj.litifyDocsFileSize.setValue((String)jsonMap.get('litify_docs__File_Size__c'));
            }
            if(jsonMap.containsKey('litify_docs__Source__c')) {
                obj.litifyDocsSource.setValue((String)jsonMap.get('litify_docs__Source__c'));
            }
            if(jsonMap.containsKey('litify_docs__Version_Id__c')) {
                obj.litifyDocsVersionId.setValue((String)jsonMap.get('litify_docs__Version_Id__c'));
            }
            if(jsonMap.containsKey('Duplicates')) {
                obj.Duplicates = (List<String>)jsonMap.get('Duplicates');
            }
            if(jsonMap.containsKey('Checksum')) {
                obj.Checksum = (String)jsonMap.get('Checksum');
            }
            return obj;
        }
    }
    public class SignedUrlObject {
        public String SignedUrl { get; set; }
        public String Expires { get; set; }
        public String Id { get; set; }
        public String FailReason { get; set; }
        public DocrioField litifyDocsRelatedTo { get; set; }
        public DocrioField litifyDocsExternalId { get; set; }
        public SignedUrlObject() {
            this.litifyDocsRelatedTo = new DocrioField('litify_docs__Related_To__c');
            this.litifyDocsExternalId = new DocrioField('litify_docs__External_Id__c');
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(SignedUrl != null) jsonMap.put('SignedUrl', SignedUrl);
            if(Expires != null) jsonMap.put('Expires', Expires);
            if(Id != null) jsonMap.put('Id', Id);
            if(FailReason != null) jsonMap.put('FailReason', FailReason);
            if(litifyDocsRelatedTo != null) jsonMap.put('litify_docs__Related_To__c', litifyDocsRelatedTo.toJson());
            if(litifyDocsExternalId != null) jsonMap.put('litify_docs__External_Id__c', litifyDocsExternalId.toJson());
            return jsonMap;
        }

        public static SignedUrlObject fromJson(Map<String, Object> jsonMap) {
            SignedUrlObject obj = new SignedUrlObject();
            if(jsonMap.containsKey('SignedUrl')) {
                obj.SignedUrl = (String)jsonMap.get('SignedUrl');
            }
            if(jsonMap.containsKey('Expires')) {
                obj.Expires = (String)jsonMap.get('Expires');
            }
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            if(jsonMap.containsKey('FailReason')) {
                obj.FailReason = (String)jsonMap.get('FailReason');
            }
            if(jsonMap.containsKey('litify_docs__Related_To__c')) {
                obj.litifyDocsRelatedTo.setValue((String)jsonMap.get('litify_docs__Related_To__c'));
            }
            if(jsonMap.containsKey('litify_docs__External_Id__c')) {
                obj.litifyDocsExternalId.setValue((String)jsonMap.get('litify_docs__External_Id__c'));
            }
            return obj;
        }
    }
    public class MultipartSignedUrlObject {
        public List<String> SignedUrls { get; set; }
        public String Expires { get; set; }
        public String Id { get; set; }
        public String UploadId { get; set; }
        public MultipartSignedUrlObject() {
        }

        public Map<String, Object> toJson() {
            Map<String, Object> jsonMap = new Map<String, Object>();
            if(SignedUrls != null) jsonMap.put('SignedUrls', SignedUrls);
            if(Expires != null) jsonMap.put('Expires', Expires);
            if(Id != null) jsonMap.put('Id', Id);
            if(UploadId != null) jsonMap.put('UploadId', UploadId);
            return jsonMap;
        }

        public static MultipartSignedUrlObject fromJson(Map<String, Object> jsonMap) {
            MultipartSignedUrlObject obj = new MultipartSignedUrlObject();
            if(jsonMap.containsKey('SignedUrls')) {
                obj.SignedUrls = (List<String>)jsonMap.get('SignedUrls');
            }
            if(jsonMap.containsKey('Expires')) {
                obj.Expires = (String)jsonMap.get('Expires');
            }
            if(jsonMap.containsKey('Id')) {
                obj.Id = (String)jsonMap.get('Id');
            }
            if(jsonMap.containsKey('UploadId')) {
                obj.UploadId = (String)jsonMap.get('UploadId');
            }
            return obj;
        }
    }}
