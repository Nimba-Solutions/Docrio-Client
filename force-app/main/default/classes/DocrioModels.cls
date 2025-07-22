/**
 * Generated Docrio API models
 */
public class DocrioModels {

    public class AnonymousEndvalueStartvalue {
        public String StartValue { get; set; }
        public String EndValue { get; set; }
    }

    public class AnonymousOffsetsortidOffsetsortvalue {
        public String offsetSortValue { get; set; }
        public String offsetSortId { get; set; }
    }

    public class AnonymousSortdirectionSortfield {
        public String sortField { get; set; }
        public String sortDirection { get; set; }
    }

    public class SearchPostRequest {
        public String Name { get; set; }
        public DocrioModels.AnonymousEndvalueStartvalue CreatedDate { get; set; }
        public String Author { get; set; }
        public String litify_docs__Related_To__c { get; set; }
        public String Custom_Field__c { get; set; }
        public String IsArchived { get; set; }
        public DocrioModels.AnonymousOffsetsortidOffsetsortvalue paginationState { get; set; }
        public String paginationToken { get; set; }
        public DocrioModels.AnonymousSortdirectionSortfield sortState { get; set; }
    }

    public class SearchPostResponse {
        public List<DocrioModels.FileRecordObject> Records { get; set; }
        public DocrioModels.AnonymousOffsetsortidOffsetsortvalue paginationState { get; set; }
        public String paginationToken { get; set; }
    }

    public class MovePostRequest {
        public List<String> Ids { get; set; }
        public String RelatedRecordId { get; set; }
    }

    public class MovePostResponse {
        public List<String> Failures { get; set; }
    }

    public class AnonymousFlattenNameSourceidTagsLitify_Docs__File_Type__CLitify_Docs__Folder_Path__CLitify_Docs__Related_To__C {
        /**
         * Only used for PDF Templates.
         * If true, the template will be flattened. This means that the template will be merged into the file as a single layer, and the resulting file will not be editable.
         * If false, the template will be merged into the file as a layer, and the resulting file will be editable.
         */
        public Boolean Flatten { get; set; }
        public String SourceId { get; set; }
        public Map<String, Object> Tags { get; set; }
        public String litify_docs__Related_To__c { get; set; }
        public String litify_docs__Folder_Path__c { get; set; }
        public String litify_docs__File_Type__c { get; set; }
        public String Name { get; set; }
    }

    public class MergePostRequest {
        public List<DocrioModels.AnonymousFlattenNameSourceidTagsLitify_Docs__File_Type__CLitify_Docs__Folder_Path__CLitify_Docs__Related_To__C> Templates { get; set; }
    }

    public class AnonymousIdNameLitify_Docs__File_Type__CLitify_Docs__Folder_Path__CLitify_Docs__Merge_Id__CLitify_Docs__Related_To__C {
        public String Id { get; set; }
        public String litify_docs__Related_To__c { get; set; }
        public String litify_docs__Folder_Path__c { get; set; }
        public String litify_docs__File_Type__c { get; set; }
        public String litify_docs__Merge_Id__c { get; set; }
        public String Name { get; set; }
    }

    public class MergePostResponse {
        public List<DocrioModels.AnonymousIdNameLitify_Docs__File_Type__CLitify_Docs__Folder_Path__CLitify_Docs__Merge_Id__CLitify_Docs__Related_To__C> Records { get; set; }
    }

    public class AnonymousNameSourceidTagsLitify_Docs__Bulk_Merge_Job__CLitify_Docs__File_Type__CLitify_Docs__Folder_Path__CLitify_Docs__Origin_Merge_Template__CLitify_Docs__Related_To__C {
        public String SourceId { get; set; }
        public String litify_docs__Origin_Merge_Template__c { get; set; }
        public String litify_docs__Related_To__c { get; set; }
        public String litify_docs__Bulk_Merge_Job__c { get; set; }
        public String litify_docs__Folder_Path__c { get; set; }
        public String litify_docs__File_Type__c { get; set; }
        public String Name { get; set; }
        public Map<String, Object> Tags { get; set; }
    }

    public class MergeGetResponse {
        public List<DocrioModels.AnonymousNameSourceidTagsLitify_Docs__Bulk_Merge_Job__CLitify_Docs__File_Type__CLitify_Docs__Folder_Path__CLitify_Docs__Origin_Merge_Template__CLitify_Docs__Related_To__C> Templates { get; set; }
    }

    public class MergeCompletePostRequest {
        public List<String> Ids { get; set; }
    }

    public class MergeCompletePostResponse {
        public Map<String, Object> Statuses { get; set; }
    }

    public class AnonymousConstDescriptionType {
        public String const { get; set; }
        public String description { get; set; }
        public String type { get; set; }
    }

    public class AnonymousExampleType {
        public DocrioModels.object type { get; set; }
        public Map<String, Object> example { get; set; }
    }

    public class AnonymousPropertiesRequiredType {
        public String type { get; set; }
        public List<String> required { get; set; }
        public DocrioModels.AnonymousExampleType properties { get; set; }
    }

    public class AnonymousSourceidTagsType {
        public DocrioModels.object type { get; set; }
        public DocrioModels.AnonymousConstDescriptionType SourceId { get; set; }
        public DocrioModels.AnonymousPropertiesRequiredType Tags { get; set; }
    }

    public class AnonymousTemplatesType {
        public DocrioModels.object type { get; set; }
        public List<DocrioModels.AnonymousSourceidTagsType> Templates { get; set; }
    }

    public class MergeSchemaGetResponse {
        public String $schema { get; set; }
        public String type { get; set; }
        public DocrioModels.AnonymousTemplatesType properties { get; set; }
    }

    public class AnonymousIdName {
        public String Id { get; set; }
        public String Name { get; set; }
    }

    public class CopyPostRequest {
        public List<DocrioModels.AnonymousIdName> Records { get; set; }
        public String RelatedRecordId { get; set; }
    }

    public class AnonymousFailreasonNewidOriginalid {
        public String OriginalId { get; set; }
        public String NewId { get; set; }
        public String FailReason { get; set; }
    }

    public class CopyPostResponse {
        public List<DocrioModels.AnonymousFailreasonNewidOriginalid> Copies { get; set; }
    }

    public class HistoryGetResponse {
        public List<DocrioModels.HistoryRecordObject> Records { get; set; }
    }

    public class FavoritesGetResponse {
        public List<DocrioModels.FileRecordObject> Records { get; set; }
    }

    public class FolderPostRequest {
        public String recordId { get; set; }
        public String folderPath { get; set; }
    }

    public class FolderZipCreatePostRequest {
        public List<String> fileInfoIds { get; set; }
        public String IsArchived { get; set; }
    }

    public class FolderZipCreatePostResponse {
        public String jobId { get; set; }
        public String presignedUrl { get; set; }
    }

    public class FolderZipCompletePostRequest {
        public String jobId { get; set; }
        public String IsArchived { get; set; }
    }

    public class UnzipStatusPostRequest {
        public List<String> jobIds { get; set; }
    }

    public class PdfConvertCompletePostRequest {
        public List<String> jobIds { get; set; }
    }

    public class FolderZipCompletePostResponse {
        public String jobId { get; set; }
        public Integer expirationTime { get; set; }
        public String status { get; set; }
        public List<String> fileInfoIds { get; set; }
        public String presignedUrl { get; set; }
    }

    public class AnonymousNameJobidLitify_Docs__Related_To__COriginalid {
        public String Name { get; set; }
        public String jobId { get; set; }
        public String originalId { get; set; }
        public String litify_docs__Related_To__c { get; set; }
    }

    public class UnzipExistingPostResponse {
        public DocrioModels.AnonymousNameJobidLitify_Docs__Related_To__COriginalid name_of_file_zip { get; set; }
    }

    public class AnonymousJobidStatus {
        public String jobId { get; set; }
        public String status { get; set; }
    }

    public class UnzipStatusPostResponse {
        public List<DocrioModels.AnonymousJobidStatus> jobStatuses { get; set; }
    }

    public class AnonymousPdfconvertidStatus {
        public String PDFConvertId { get; set; }
        public String Status { get; set; }
    }

    public class PdfConvertPostResponse {
        public List<DocrioModels.AnonymousPdfconvertidStatus> ConvertedFiles { get; set; }
    }

    public class PdfConvertCompletePostResponse {
        public List<DocrioModels.AnonymousJobidStatus> jobStatuses { get; set; }
    }

    public class VersionsGetResponse {
        public List<String> Versions { get; set; }
    }

    public class AnonymousIdPreviewtypeVersionid {
        public String PreviewType { get; set; }
        public String Id { get; set; }
        public String VersionId { get; set; }
    }

    public class PreviewPostRequest {
        public List<DocrioModels.AnonymousIdPreviewtypeVersionid> Records { get; set; }
        public String IsArchived { get; set; }
    }

    public class PreviewPostResponse {
        public List<DocrioModels.SignedUrlObject> Records { get; set; }
    }

    public class FilesInfoGetResponse {
        public List<DocrioModels.FileRecordObject> Records { get; set; }
    }

    public class FilesGetResponse {
        public List<DocrioModels.SignedUrlObject> Records { get; set; }
    }

    public class FilesDeleteResponse {
        public List<String> Failures { get; set; }
    }

    public class FilesPatchRequest {
        public String Id { get; set; }
        public String Name { get; set; }
        public String litify_docs__Author__c { get; set; }
        public String litify_docs__Description__c { get; set; }
        public String litify_docs__External_File_Path__c { get; set; }
        public String litify_docs__External_ID__c { get; set; }
        public String litify_docs__Folder_Path__c { get; set; }
        public String litify_docs__From__c { get; set; }
        public String litify_docs__To__c { get; set; }
        public String litify_docs__Related_To_Api_Name__c { get; set; }
        public String litify_docs__Related_To__c { get; set; }
        public String litify_docs__File_Type__c { get; set; }
        public String Custom_Field__c { get; set; }
    }

    public class FilesPutRequest {
        public String Id { get; set; }
    }

    public class FilesPostResponse {
        public DocrioModels.SignedUrlObject name_of_file_png { get; set; }
    }

    public class FilesTAPostResponse {
        public DocrioModels.SignedUrlObject name_of_file_png { get; set; }
    }

    public class MultipartFilesPutRequest {
        public String Id { get; set; }
        public Integer Parts { get; set; }
        public String ContentType { get; set; }
        public Integer fileVersionNumber { get; set; }
    }

    public class MultipartFilesPostResponse {
        public DocrioModels.MultipartSignedUrlObject name_of_file_png { get; set; }
    }

    public class MultipartFilesPutResponse {
        public DocrioModels.MultipartSignedUrlObject name_of_file_png { get; set; }
    }

    public class AnonymousEtagPartnumber {
        public Integer PartNumber { get; set; }
        public String ETag { get; set; }
    }

    public class AnonymousPartsUploadid {
        public String UploadId { get; set; }
        public List<DocrioModels.AnonymousEtagPartnumber> Parts { get; set; }
    }

    public class MultipartFilesCompletePostRequest {
        public List<String> Ids { get; set; }
        public DocrioModels.AnonymousPartsUploadid a1E1U000001juz6UAA { get; set; }
    }

    public class MultipartFilesCompletePostResponse {
        public String Message { get; set; }
        public List<DocrioModels.MultipartFileRecordObject> Successes { get; set; }
        public List<String> Failures { get; set; }
    }

    public class MultipartRefreshUrlsPutResponse {
        public DocrioModels.MultipartSignedUrlObject name_of_file_png { get; set; }
    }

    public class MultipartFilesRefreshPutRequest {
        public String Id { get; set; }
        public String UploadId { get; set; }
        public Integer StartIndex { get; set; }
        public Integer EndIndex { get; set; }
    }

    public class MultipartFilesRefreshPutResponse {
        public String Message { get; set; }
        public List<DocrioModels.MultipartFileRecordObject> Successes { get; set; }
        public List<String> Failures { get; set; }
    }

    public class AnonymousFileoneFiletwo {
        public String fileOne { get; set; }
        public String fileTwo { get; set; }
    }

    public class FilesAssociatePostRequest {
        public List<DocrioModels.AnonymousFileoneFiletwo> fileRelationships { get; set; }
        public String relationshipType { get; set; }
    }

    public class FilesAssociatePostResponse {
        public String Message { get; set; }
    }

    public class FilesAssociateDeleteRequest {
        public List<DocrioModels.AnonymousFileoneFiletwo> fileRelationships { get; set; }
    }

    public class FilesCompletePostRequest {
        public List<String> Ids { get; set; }
        public Boolean CheckIn { get; set; }
    }

    public class FilesCompletePostResponse {
        public String Message { get; set; }
        public List<DocrioModels.FileRecordObject> Successes { get; set; }
        public List<String> Failures { get; set; }
    }

    public class FilesRelatedGetResponse {
        public DocrioModels.FileRecordObject Records { get; set; }
        public DocrioModels.NextBatchObject NextBatch { get; set; }
    }

    public class FilesToggleRequest {
        // salesforce file Id
        public List<String> Ids { get; set; }
    }

    public class FilesToggleResponse {
        public String Message { get; set; }
    }

    public class AnonymousFileinfoidFiletypeName {
        public String name { get; set; }
        public String fileInfoId { get; set; }
        public String fileType { get; set; }
    }

    public class FilesCombineRequest {
        public String relatedToApiName { get; set; }
        public String fileRelatedTo { get; set; }
        public String fileName { get; set; }
        public String folderPath { get; set; }
        public List<DocrioModels.AnonymousFileinfoidFiletypeName> combineFiles { get; set; }
    }

    public class AnonymousFilenameFiletypePages {
        public String fileName { get; set; }
        public Object pages { get; set; }
        public String fileType { get; set; }
    }

    public class FilesSplitRequest {
        public String originalFileId { get; set; }
        public String originalFileRelatedTo { get; set; }
        public String originalFolderPath { get; set; }
        public String relatedToApiName { get; set; }
        public String originalFileType { get; set; }
        public List<DocrioModels.AnonymousFilenameFiletypePages> sections { get; set; }
    }

    public class FilesCombineResponse {
        public String Name { get; set; }
        public String Id { get; set; }
        public String litify_docs__File_Type__c { get; set; }
    }

    public class FilesCombineCompleteRequest {
        public String Id { get; set; }
    }

    public class AnonymousExpirationtimeJobidStatus {
        public Integer expirationTime { get; set; }
        public String jobId { get; set; }
        public String status { get; set; }
    }

    public class FilesCombineCompleteResponse {
        public Map<String, Object> Errors { get; set; }
        public List<DocrioModels.AnonymousExpirationtimeJobidStatus> Statuses { get; set; }
    }

    public class FilesSplitResponse {
        public Object fileInfoRecords { get; set; }
    }

    public class FilesSplitCompleteRequest {
        public Object Ids { get; set; }
    }

    public class FilesSplitCompleteResponse {
        public Map<String, Object> Errors { get; set; }
        public Object Statuses { get; set; }
    }

    public class ErrorMessageResponse {
        public String Message { get; set; }
    }

    public class ErrorMessageResponseWithFailReason {
        public String Message { get; set; }
        public String FailReason { get; set; }
    }

    public class AnonymousLitify_Docs__Expiration_Date__CLitify_Docs__File_Size__CLitify_Docs__File_Type__CLitify_Docs__Password__CLitify_Docs__Unique_Id__C {
        public String litify_docs__Expiration_Date__c { get; set; }
        public Integer litify_docs__File_Size__c { get; set; }
        public String litify_docs__File_Type__c { get; set; }
        public String litify_docs__Password__c { get; set; }
        public String litify_docs__Unique_Id__c { get; set; }
    }

    public class ExternalLinkPostRequest {
        public List<DocrioModels.FileRecordObject> FileInfoRecords { get; set; }
        public DocrioModels.AnonymousLitify_Docs__Expiration_Date__CLitify_Docs__File_Size__CLitify_Docs__File_Type__CLitify_Docs__Password__CLitify_Docs__Unique_Id__C FileLinkRecord { get; set; }
    }

    public class AnonymousIdLitify_Docs__Expiration_Date__CLitify_Docs__Password__CLitify_Docs__Unique_Id__C {
        public String Id { get; set; }
        public String litify_docs__Unique_Id__c { get; set; }
        public Boolean litify_docs__Password__c { get; set; }
        public String litify_docs__Expiration_Date__c { get; set; }
    }

    public class ExternalLinkPostResponse {
        public String CreatedByName { get; set; }
        public String OrganizationName { get; set; }
        public List<DocrioModels.AnonymousIdLitify_Docs__Expiration_Date__CLitify_Docs__Password__CLitify_Docs__Unique_Id__C> Records { get; set; }
    }

    public class ExternalLinkDownloadResponse {
        public String FileId { get; set; }
    }

    public class ExternalLinkPreviewResponse {
        public String SignedUrl { get; set; }
        public String Expires { get; set; }
    }

    public class AnonymousFilesFolders {
        public List<Object> files { get; set; }
        public List<Object> folders { get; set; }
    }

    public class AnonymousA1D52000001Thq9Eac {
        public DocrioModels.AnonymousFilesFolders a1D52000001Thq9EAC { get; set; }
    }

    public class ExternalLinkGetResponse {
        public String Expires { get; set; }
        public String SharedBy { get; set; }
        public String OrgName { get; set; }
        public List<Object> Records { get; set; }
        public DocrioModels.AnonymousA1D52000001Thq9Eac FolderReference { get; set; }
    }

    public class ExternalLinkZipStatusResponse {
        public String ZipFileId { get; set; }
        public String Status { get; set; }
        public String SignedUrl { get; set; }
    }

    public class ExternalLinkDeleteResponse {
        public List<String> Successes { get; set; }
        public List<String> Failures { get; set; }
    }

    public class AnonymousFilepathreferenceFiles {
        public List<String> files { get; set; }
        public DocrioModels.AnonymousA1D52000001Thq9Eac filePathReference { get; set; }
    }

    public class ExternalLinkZipRequest {
        public List<String> FileIds { get; set; }
        public DocrioModels.AnonymousFilepathreferenceFiles FileIdsWithFolderPath { get; set; }
    }

    public class ExternalLinkZipResponse {
        public String ZipFileId { get; set; }
        public String Status { get; set; }
    }

    public class ArchivePostRequest {
        public Object FileInfoIds { get; set; }
        public Object RecordIds { get; set; }
    }

    public class ArchivePostResponse {
        public String externalJobId { get; set; }
    }

    public class ArchiveStatusGetResponse {
        public String externalJobId { get; set; }
        public String status { get; set; }
        public String results { get; set; }
    }

    public class FilesShareRequest {
        public List<String> Ids { get; set; }
        public Boolean share { get; set; }
    }

    public class FilesRestoreResponse {
        public List<String> Successes { get; set; }
        public List<String> Failures { get; set; }
    }

    public class TextContentPostResponse {
        public String SignedUrl { get; set; }
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
        public String litify_docs__File_Info__c { get; set; }
        public String litify_docs__File_Info__c__User__c { get; set; }
        public String litify_docs__File_Info__c__Date__c { get; set; }
        public String litify_docs__File_Info__c__Action__c { get; set; }
    }

    public class AnonymousNameSubfolders {
        public String name { get; set; }
        public List<Map<String, Object>> subfolders { get; set; }
    }

    public class FolderStructureObject {
        public String name { get; set; }
        public List<DocrioModels.AnonymousNameSubfolders> subfolders { get; set; }
    }

    public class NextBatchObject {
        public String OffsetId { get; set; }
        public String OffsetValue { get; set; }
    }

    public class AnonymousTypeUrl {
        public String type { get; set; }
        public String url { get; set; }
    }

    public class FileRecordObject {
        public DocrioModels.AnonymousTypeUrl attributes { get; set; }
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
        public String litify_docs__Author__c { get; set; }
        public String litify_docs__Description__c { get; set; }
        public String litify_docs__External_File_Path__c { get; set; }
        public String litify_docs__External_ID__c { get; set; }
        public String litify_docs__Folder_Path__c { get; set; }
        public String litify_docs__From__c { get; set; }
        public String litify_docs__To__c { get; set; }
        public String litify_docs__Latest_Version__c { get; set; }
        public Boolean litify_docs__Complete__c { get; set; }
        public String litify_docs__File_Link__c { get; set; }
        public String litify_docs__Related_To_Api_Name__c { get; set; }
        public String litify_docs__File_Type__c { get; set; }
        public Integer litify_docs__File_Size__c { get; set; }
        public String litify_docs__Related_To__c { get; set; }
        public List<String> Duplicates { get; set; }
        // Checksum calculated based on file content
        public String Checksum { get; set; }
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
        public Boolean litify_docs__Complete__c { get; set; }
        public String litify_docs__File_Link__c { get; set; }
        public String litify_docs__File_Type__c { get; set; }
        public String litify_docs__Folder_Path_First_255__c { get; set; }
        public String litify_docs__Folder_Path_Last_255__c { get; set; }
        public String litify_docs__Folder_Path__c { get; set; }
        public Integer litify_docs__Latest_Version_Formula__c { get; set; }
        public Boolean litify_docs__OCR_Compatible__c { get; set; }
        public String litify_docs__Related_To_Api_Name__c { get; set; }
        public String litify_docs__Related_To__c { get; set; }
        public Integer litify_docs__Latest_Version__c { get; set; }
        public String litify_docs__Updated_By__c { get; set; }
        public String litify_docs__Updated_On__c { get; set; }
        public String litify_docs__Updated_By_Name__c { get; set; }
        public Boolean litify_docs__Delete__c { get; set; }
        public Boolean litify_docs__Has_Attachments_Legacy__c { get; set; }
        public Integer litify_docs__File_Size__c { get; set; }
        public String litify_docs__Source__c { get; set; }
        public String litify_docs__Version_Id__c { get; set; }
        public List<String> Duplicates { get; set; }
        // Checksum calculated based on file content
        public String Checksum { get; set; }
    }

    public class SignedUrlObject {
        public String SignedUrl { get; set; }
        public String Expires { get; set; }
        public String Id { get; set; }
        public String FailReason { get; set; }
        public String litify_docs__Related_To__c { get; set; }
        public String litify_docs__External_Id__c { get; set; }
    }

    public class MultipartSignedUrlObject {
        public List<String> SignedUrls { get; set; }
        public String Expires { get; set; }
        public String Id { get; set; }
        public String UploadId { get; set; }
    }
}
