/**
 * Generated Docrio API service layer
 */
public class DocrioService {

    // Archival Tool Methods
    /**
     * Archive files by file info or record id
     * This endpoint can be used to archive multiple files or records using file info id or document related to.
     * Either the FileInfoIds or RecordIds parameter in the request body must be populated. The IncludeChildRecords parameter is only considered when archiving by record.
     * 
     * The response will return an externalJobId that can be used to track job updates using the /archive/status endpoint.
     * 
     * **Note: The maximum number of FileInfoIds that can be included is 250,000. The maximum number of RecordIds that can be included is 50,000.
     * **Additional Note: Filing Cabinet and DocAssign cannot be included in the RecordIds list
     * 
     *
     * @param requestBody Array of either FileInfoIds or RecordIds the user would like to archive.
     */
    public static void postArchive(DocrioModels.ArchivePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/archive', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

    }

    /**
     * Restore archived files by file info or record id
     * This endpoint can be used to restore multiple files or records using file info id or document related to.
     * Either the FileInfoIds or RecordIds parameter in the request body must be populated. The IncludeChildRecords parameter is only considered when archiving by record.
     * 
     * The response will return an externalJobId that can be used to track job updates using the /archive/restore/status endpoint.
     * 
     * **Note:** The maximum number of FileInfoIds that can be included is 250,000. The maximum number of RecordIds that can be included is 50,000.
     * *Additional Note: Filing Cabinet and DocAssign cannot be included in the RecordIds list*
     * 
     *
     * @param requestBody Array of either FileInfoIds or RecordIds the user would like to archive.
     */
    public static void postArchiveRestore(DocrioModels.ArchivePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/archive/restore', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

    }

    /**
     * Get the status of an existing archive job
     * This endpoint can be used to retrieve the status of an existing archive job by providing the externalJobId as a path parameter.
     * 
     *
     * @param externalJobId Path parameter from URL
     * @return DocrioModels.ArchiveStatusGetResponse
     */
    public static DocrioModels.ArchiveStatusGetResponse getArchiveStatus(String externalJobId) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/archive/status/' + externalJobId, null, 'application/json');

        if(response != null) {
            return (DocrioModels.ArchiveStatusGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.ArchiveStatusGetResponse.class);
        }
        return null;
    }

    /**
     * Get the status of an existing restore job
     * This endpoint can be used to retrieve the status of an existing restore job by providing the externalJobId as a path parameter.
     * 
     *
     * @param externalJobId Path parameter from URL
     * @return DocrioModels.ArchiveStatusGetResponse
     */
    public static DocrioModels.ArchiveStatusGetResponse getArchiveRestoreStatus(String externalJobId) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/archive/restore/status/' + externalJobId, null, 'application/json');

        if(response != null) {
            return (DocrioModels.ArchiveStatusGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.ArchiveStatusGetResponse.class);
        }
        return null;
    }


    // Document Generation Methods
    /**
     * Begins the process of merging a document with merge tags and an object containing the merge definitions
     * Merge is responsible for enqueing the input file record IDs (SourceID) to be merged with the information in the Tags property.
     * Salesforce will create a Record for the resulting merged files which will get returned as output
     * 
     *
     * @param requestBody JSON array where each entry contains metadata about the file being merged and a set of tags that will be used in the merging process.
     * @return DocrioModels.MergePostResponse
     */
    public static DocrioModels.MergePostResponse postMerge(DocrioModels.MergePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/merge', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.MergePostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.MergePostResponse.class);
        }
        return null;
    }

    /**
     * Returns the exact JSON containing metadata about the file being merged, required to call POST /merge.
     * Generates the merge JSON necessary to perform a file merge, includes merge tags and their corresponding values.
     * 
     *
     * @param TemplateId The Salesforce Id of the litify_docs__Template__c record that the user would like to merge
     * @param RecordId The Salesforce Id of the record the user would like to merge the file to
     * @return DocrioModels.MergeGetResponse
     */
    public static DocrioModels.MergeGetResponse getMerge(String TemplateId, String RecordId) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/merge', null, 'application/json');

        if(response != null) {
            return (DocrioModels.MergeGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.MergeGetResponse.class);
        }
        return null;
    }

    /**
     * Must be called after a file has been successfully merged.
     * After a file has been successfully merged, this call must be made to get metadata on the file and insert it into salesforce.
     * 
     *
     * @param requestBody JSON array containing all salesforce file record ids of the files to be marked as completed
     * @return DocrioModels.MergeCompletePostResponse
     */
    public static DocrioModels.MergeCompletePostResponse postMergeComplete(DocrioModels.MergeCompletePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/merge/complete', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.MergeCompletePostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.MergeCompletePostResponse.class);
        }
        return null;
    }

    /**
     * Returns JSON that describes the JSON returned by the GET /merge endpoint for a specific template.
     * This endpoint will return the schema describing the metadata returned from the GET /merge endpoint for a specific template.
     * 
     *
     * @param TemplateId The Salesforce Id of the litify_docs__Template__c record that the user will use in the GET /merge request
     * @return DocrioModels.MergeSchemaGetResponse
     */
    public static DocrioModels.MergeSchemaGetResponse getMergeSchema(String TemplateId) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/merge/schema', null, 'application/json');

        if(response != null) {
            return (DocrioModels.MergeSchemaGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.MergeSchemaGetResponse.class);
        }
        return null;
    }


    // File Management Methods
    /**
     * Download files
     * This endpoint can be used to download files from Docrio.
     * The response includes a collection of URLs that can be used to download the requested files.
     * 
     * **Downloading a single file (latest version):** specify the Id of the file in the `Id` query parameter
     * 
     * **Downloading a single file (specific version):** specify the Id of the file in the `Id` query parameter, and the version of the file in the `VersionId` query parameter.
     * 
     * **Downloading multiple files (latest versions):** specify the Ids of the files in the `Ids` query parameter as a comma-separated list
     * 
     * *Note: download URLs expire after 5 minutes*
     * 
     * @return DocrioModels.FilesGetResponse
     */
    public static DocrioModels.FilesGetResponse getFiles() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/files', null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesGetResponse.class);
        }
        return null;
    }

    /**
     * Marks one or more file records for deletion.
     * Providing an array of salesforce record ids, all salesforce record ids will be marked for deletion and no longer available for any request.
     * There is a maximum of 100 salesforce record ids per request.
     * 
     * @return DocrioModels.FilesDeleteResponse
     */
    public static DocrioModels.FilesDeleteResponse deleteFiles() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('DELETE', '/files', null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesDeleteResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesDeleteResponse.class);
        }
        return null;
    }

    /**
     * Updates field values on an existing file record without also making a corresponding change to the underlying file.
     * Providing any data that is found in a file record, will update the file record with the new data. However, RelatedRecordId can not be updated, the MOVE endpoint must be used to update a RelatedRecordId.
     * Only a salesforce file record id is required.
     * 
     *
     * @param requestBody JSON object containing values to update on the file record - only id is required.
     * @return Map<String, Object>
     */
    public static Map<String, Object> patchFiles(DocrioModels.FilesPatchRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('PATCH', '/files', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (Map<String, Object>)JSON.deserialize(JSON.serialize(response), Map<String, Object>.class);
        }
        return null;
    }

    /**
     * Creates a version of a specified file.
     * Providing a single salesforce file record id, a signed url will be created for a new version of that file.
     * The signed url is valid for 5 minutes and can be used to upload the file.
     * 
     *
     * @param requestBody Salesforce file record id of the file you want to version.
     * @return Map<String, Object>
     */
    public static Map<String, Object> putFiles(DocrioModels.FilesPutRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('PUT', '/files', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (Map<String, Object>)JSON.deserialize(JSON.serialize(response), Map<String, Object>.class);
        }
        return null;
    }

    /**
     * Creates multiple or single salesforce file record ids and return signed urls.
     * Providing single or multiple file names, a salesforce file record id and signed url will be created for each file name provided.
     * The response will be the original file name provided in the request mapped to an object containing that files signed url information and salesforce file record id.
     * The signed url is valid for 5 minutes and can be used to upload the file.
     * 
     * @return DocrioModels.FilesPostResponse
     */
    public static DocrioModels.FilesPostResponse postFiles() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files', null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesPostResponse.class);
        }
        return null;
    }

    /**
     * Creates multiple or single salesforce file record ids and return signed urls.
     * Providing single or multiple file names, a salesforce file record id and signed url will be created for each file name provided using transfer accelerator.
     * The response will be the original file name provided in the request mapped to an object containing that files signed url information and salesforce file record id.
     * The signed url is valid for 5 minutes and can be used to upload the file.
     * 
     * @return DocrioModels.FilesTAPostResponse
     */
    public static DocrioModels.FilesTAPostResponse postFilesTa() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/ta', null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesTAPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesTAPostResponse.class);
        }
        return null;
    }

    /**
     * Creates multiple or single file relationships to signify whether pairs of files should be viewed or managed together.
     * Providing single or multiple file relationship pairs, a file relationship will be created for each pair provided.
     * The response will return a 201 status code for a successful submission.
     * 
     *
     * @param requestBody JSON array containing objects that map a file to another file to create a relationship between the pair.
     * @return DocrioModels.FilesAssociatePostResponse
     */
    public static DocrioModels.FilesAssociatePostResponse postFilesAssociates(DocrioModels.FilesAssociatePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/associates', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesAssociatePostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesAssociatePostResponse.class);
        }
        return null;
    }

    /**
     * Marks one or more file relationships for deletion.
     * Providing an array of salesforce file relationships, all provided salesforce file relationships will be deleted.
     * There is a maximum of 100 salesforce file relationships per request.
     * 
     *
     * @param requestBody JSON array containing objects that map a file to another file to delete a relationship between the pair.
     * @return Map<String, Object>
     */
    public static Map<String, Object> deleteFilesAssociates(DocrioModels.FilesAssociateDeleteRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('DELETE', '/files/associates', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (Map<String, Object>)JSON.deserialize(JSON.serialize(response), Map<String, Object>.class);
        }
        return null;
    }

    /**
     * Returns an array file records for the specified salesforce file record ids.
     * Providing a list of salesforce file record ids, an array of file records will be returned.
     * 
     * @return DocrioModels.FilesInfoGetResponse
     */
    public static DocrioModels.FilesInfoGetResponse getFilesInfo() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/files/info', null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesInfoGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesInfoGetResponse.class);
        }
        return null;
    }

    /**
     * Must be called after a file has been successfully uploaded.
     * After a file has been successfully uploaded using a SignedUrl, this call must be made to get metadata on the file and insert it into salesforce.
     * 
     *
     * @param requestBody JSON object containing property Ids that is mapped to an array of salesforce file record ids that need to be marked as complete. Optionally, you can provide a CheckIn boolean parameter to either check in or leave the file(s) checked out. If not provided, the default is to check in the file(s). The CheckIn value applies to all files in the request.
     * @return DocrioModels.FilesCompletePostResponse
     */
    public static DocrioModels.FilesCompletePostResponse postFilesComplete(DocrioModels.FilesCompletePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/complete', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesCompletePostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesCompletePostResponse.class);
        }
        return null;
    }

    /**
     * Returns a list of file records which are related to the specified related salesforce record id or to one of its child records.
     * Providing a related salesforce record id, an array will be returned containing all file records related to that id.
     * 
     *
     * @param RelatedRecordId A single related salesforce record id.
     * @param SortBy Salesforce field to sort files by. When SortBy or SortDirection is blank this defaults to "Name".
     * @param SortDirection Sort direction, ASC or DESC. When SortBy or SortDirection is blank this defaults to "ASC".
     * @param OffsetId Used for pagination, Id of the last file in the previous collection. OffsetId and OffsetValue should be used together.
     * @param OffsetValue Used for pagination, SortBy field's value of the last file in the previous collection. OffsetId and OffsetValue should be used together.
     * @param IncludeRelated If true, we return files from child records of the related record. Setting to false can improve performance on large datasets.
     * @param MaxFiles Used to set number of files to return
     * @param Fields A comma-separated list of file info fields to return.
     * @return DocrioModels.FilesRelatedGetResponse
     */
    public static DocrioModels.FilesRelatedGetResponse getFilesRelated(String RelatedRecordId, String SortBy, String SortDirection, String OffsetId, String OffsetValue, Boolean IncludeRelated, Integer MaxFiles, String Fields) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/files/related', null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesRelatedGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesRelatedGetResponse.class);
        }
        return null;
    }

    /**
     * Restores one or more soft-deleted file info records.
     * Restores one or more soft-deleted file info records. A maximum of 100 file info ids can be provided per request.
     * 
     *
     * @param Ids A comma-separated list of file info ids to restore.
     * @return DocrioModels.FilesRestoreResponse
     */
    public static DocrioModels.FilesRestoreResponse postFilesRestore(String Ids) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/restore', null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesRestoreResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesRestoreResponse.class);
        }
        return null;
    }

    /**
     * Toggles the client portal share status of one or more files.
     * Will share/unshare a subset of files to/from the client portal in Salesforce based on the value of the `share` parameter.
     * 
     *
     * @param requestBody The request payload
     * @return Map<String, Object>
     */
    public static Map<String, Object> postFilesShare(DocrioModels.FilesShareRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/share', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (Map<String, Object>)JSON.deserialize(JSON.serialize(response), Map<String, Object>.class);
        }
        return null;
    }

    /**
     * Checks out files.
     * Allows the user to "check out" one or more files from Docrio by providing a list of salesforce file Ids.
     * In order to check out a file, it must not already be checked out by another user.
     * Valid, but non-existent, file ids will be ignored.
     * *Note: There are no partial checkouts - all files must succeed or nothing is checked out.*
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.FilesToggleResponse
     */
    public static DocrioModels.FilesToggleResponse postFilesCheckout(DocrioModels.FilesToggleRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/checkout', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesToggleResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesToggleResponse.class);
        }
        return null;
    }

    /**
     * Checks in files.
     * Allows the user to "check in" one or more files to Docrio by providing a list of salesforce file Ids.
     * In order to check in a file, it must not already be checked in, or be checked out by another user.
     * Valid, but non-existent, file ids will be ignored.
     * *Note: There are no partial checkins - all files must succeed or nothing is checked in.*
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.FilesToggleResponse
     */
    public static DocrioModels.FilesToggleResponse postFilesCheckin(DocrioModels.FilesToggleRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/checkin', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesToggleResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesToggleResponse.class);
        }
        return null;
    }

    /**
     * Initializes combine file process
     * Kicks off the combine file process with the given files
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.FilesCombineResponse
     */
    public static DocrioModels.FilesCombineResponse postFilesCombine(DocrioModels.FilesCombineRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/combine', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesCombineResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesCombineResponse.class);
        }
        return null;
    }

    /**
     * Checks the status of the requested combine pdf
     * After calling files/combine, use this endpoint to track the process of the PDF.
     * 
     * This statuses can be of the following:
     * 
     * COMPLETED
     * 
     * PROCESSING
     * 
     * ERROR
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.FilesCombineCompleteResponse
     */
    public static DocrioModels.FilesCombineCompleteResponse postFilesCombineComplete(DocrioModels.FilesCombineCompleteRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/combine/complete', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesCombineCompleteResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesCombineCompleteResponse.class);
        }
        return null;
    }

    /**
     * Kicks off PDF split.
     * Allows the user to split the PDF into multiple PDF. This will kick off PDF Split
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.FilesSplitResponse
     */
    public static DocrioModels.FilesSplitResponse postFilesSplit(DocrioModels.FilesSplitRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/split', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesSplitResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesSplitResponse.class);
        }
        return null;
    }

    /**
     * Checks the status of all the split pdf.
     * Check the status of all the newly created PDF from PDF Split Job
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.FilesSplitCompleteResponse
     */
    public static DocrioModels.FilesSplitCompleteResponse postFilesSplitComplete(DocrioModels.FilesSplitCompleteRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/files/split/complete', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.FilesSplitCompleteResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FilesSplitCompleteResponse.class);
        }
        return null;
    }

    /**
     * Initiates multipart upload process that creates multiple or single salesforce file record ids and return signed urls and upload Ids.
     * Providing single or multiple file names and parts number, a salesforce file record id, signed urls, and upload id will be created for each file name provided.
     * The signed urls are valid for 5 minutes and used to upload multi-part files.
     * 
     * @return DocrioModels.MultipartFilesPostResponse
     */
    public static DocrioModels.MultipartFilesPostResponse postMultipart() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/multipart', null, 'application/json');

        if(response != null) {
            return (DocrioModels.MultipartFilesPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.MultipartFilesPostResponse.class);
        }
        return null;
    }

    /**
     * Initiates multipart upload process that updates single salesforce file record id and return signed urls and upload Id.
     * Providing a record id and parts number, signed urls, and upload id will be created and returned for the record.
     * The signed urls are valid for 5 minutes and used to upload multi-part files.
     * 
     *
     * @param requestBody JSON array containing objects that map Name to the name of the file that is being uploaded.
     * @return DocrioModels.MultipartFilesPutResponse
     */
    public static DocrioModels.MultipartFilesPutResponse putMultipart(DocrioModels.MultipartFilesPutRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('PUT', '/multipart', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.MultipartFilesPutResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.MultipartFilesPutResponse.class);
        }
        return null;
    }

    /**
     * Must be called after multipart part files have been successfully uploaded.
     * After a file has been successfully uploaded using SignedUrls, this call must be made to merge part files uploaded to S3 then get metadata on the merged file and insert it into salesforce.
     * 
     *
     * @param requestBody JSON object containing property Ids that is mapped to an array of salesforce file record ids that need to be marked as complete.
     * @return DocrioModels.MultipartFilesCompletePostResponse
     */
    public static DocrioModels.MultipartFilesCompletePostResponse postMultipartComplete(DocrioModels.MultipartFilesCompletePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/multipart/complete', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.MultipartFilesCompletePostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.MultipartFilesCompletePostResponse.class);
        }
        return null;
    }

    /**
     * Optionally called to generate presigned URLs for an existing multipart upload using uploadId.
     * After initiating a multipart upload, presigned URLs can be generated to replace expired presigned urls.
     * It can also generate new presigned urls if an existing multipart upload needs more presigned urls than initially anticipated.
     * 
     *
     * @param requestBody JSON object containing property Ids that is mapped to an array of salesforce file record ids that need to be marked as complete.
     * @return DocrioModels.MultipartFilesRefreshPutResponse
     */
    public static DocrioModels.MultipartFilesRefreshPutResponse putMultipartRefresh(DocrioModels.MultipartFilesRefreshPutRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('PUT', '/multipart/refresh', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.MultipartFilesRefreshPutResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.MultipartFilesRefreshPutResponse.class);
        }
        return null;
    }

    /**
     * Returns the OCR'ed text content of a given file.
     * Providing a single salesforce file info id, user will receive a SignedUrl that will point to the given text content of a document, separated by pages.
     * *Note: This will only work for orgs where OCR is enabled*
     * 
     * @return DocrioModels.TextContentPostResponse
     */
    public static DocrioModels.TextContentPostResponse getTextcontent() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/textcontent', null, 'application/json');

        if(response != null) {
            return (DocrioModels.TextContentPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.TextContentPostResponse.class);
        }
        return null;
    }

    /**
     * Returns the OCR'ed text content of multiple files.
     * Providing an array of salesforce file info ids, user will receive a paiload containing SignedUrls that 
     * will point to the given text content of a document, separated by pages.
     * *Note: This will only work for orgs where OCR is enabled*
     * 
     * @return Map<String, Object>
     */
    public static Map<String, Object> postTextcontent() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/textcontent', null, 'application/json');

        if(response != null) {
            return (Map<String, Object>)JSON.deserialize(JSON.serialize(response), Map<String, Object>.class);
        }
        return null;
    }

    /**
     * Returns a list of all versions that currently exist for a given file record.
     * Providing a single salesforce record id, an array will be returned containing all of the version ids for that file.
     * 
     * @return DocrioModels.VersionsGetResponse
     */
    public static DocrioModels.VersionsGetResponse getVersions() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/versions', null, 'application/json');

        if(response != null) {
            return (DocrioModels.VersionsGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.VersionsGetResponse.class);
        }
        return null;
    }

    /**
     * Returns the latest version of the specified salesforce file record ids.
     * Providing an array of salesforce file record ids, an array of objects will be returned containing the salesforce file record id and its latest version id.
     * 
     * @return Map<String, Object>
     */
    public static Map<String, Object> getVersion() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/version', null, 'application/json');

        if(response != null) {
            return (Map<String, Object>)JSON.deserialize(JSON.serialize(response), Map<String, Object>.class);
        }
        return null;
    }

    /**
     * Returns a signed url to preview a file.
     * Providing a salesforce file record id, and preview type (e.g. pdf, image) a signed url will be returned that can be used to download the preview of that file.
     * If a version id is provided, it will return a preview for that version. Otherwise, it will return the latest version.
     * The signed url is valid for 5 minutes and can be used to download the file.
     * 
     *
     * @param PreviewType Type of preview to return - Currently supports "pdf" and "image".
     * @return Map<String, Object>
     */
    public static Map<String, Object> getPreview(String PreviewType) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/preview', null, 'application/json');

        if(response != null) {
            return (Map<String, Object>)JSON.deserialize(JSON.serialize(response), Map<String, Object>.class);
        }
        return null;
    }

    /**
     * Returns an array of signed urls of files to preview and fail reasons for specific files.
     * Providing an array of objects each consisting of a salesforce file record id a signed url will be returned for each entry that can be used to download the preview of that file.
     * Each signed url is valid for 5 minutes and can be used to download the file.
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.PreviewPostResponse
     */
    public static DocrioModels.PreviewPostResponse postPreview(DocrioModels.PreviewPostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/preview', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.PreviewPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.PreviewPostResponse.class);
        }
        return null;
    }

    /**
     * Moves the file records to the specified related salesforce record id.
     * Move is responsible for modifying the RelatedTo value on one or more File Info records.
     * Providing an array of salesforce file record ids, the file records will be moved to the specified related salesforce record id.
     * 
     *
     * @param requestBody JSON object containing all salesforce file record ids that will be moved to the specified related salesforce record id.
     * @return DocrioModels.MovePostResponse
     */
    public static DocrioModels.MovePostResponse postMove(DocrioModels.MovePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/move', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.MovePostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.MovePostResponse.class);
        }
        return null;
    }

    /**
     * Creates a duplicate of one or more existing files.
     * Providing an array of salesforce file record ids mapped to their new copy names, will create a complete new copy of the files.
     * 
     *
     * @param requestBody JSON object containing an array of current salesforce file record ids that are to be copied, mapped to the copied files new name. Also, the related salesforce record id that the copied files will live.
     * @return DocrioModels.CopyPostResponse
     */
    public static DocrioModels.CopyPostResponse postCopy(DocrioModels.CopyPostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/copy', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.CopyPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.CopyPostResponse.class);
        }
        return null;
    }

    /**
     * Returns an array of history records for the specified file.
     * Providing a single salesforce record id, an array of history records will be returned.
     * 
     * @return DocrioModels.HistoryGetResponse
     */
    public static DocrioModels.HistoryGetResponse getHistory() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/history', null, 'application/json');

        if(response != null) {
            return (DocrioModels.HistoryGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.HistoryGetResponse.class);
        }
        return null;
    }

    /**
     * Returns an array of file records matching the provided search criteria.
     * Providing a search criteria, up to 1000 files records will be returned that match the criteria.
     * At minumum the search criteria must contain one search value.
     * "Custom_Field__c" represents values for custom fields that individual firms may create on the File Info object. If custom field values are passed, the name provided in the JSON object must match the API name of the custom field within Litify.
     * 
     * For an archive search files will always be sorted by Name. To paginate - enter the value of the last file Id and Name retrieved in the paginationState offsetSortId and offsetSortValue fields, respectively.
     * Only the sortState - sortDirection field will be respected for archive search.
     * 
     *
     * @param requestBody JSON object containing search criteria - at least one value must be provided (e.g. Name, CreatedDate, Category, etc.). Pagination and sorting is supported. Endpoint returns up to 1000 records per request. offsetSortValue is the value of the field specified in SortBy for the last record in the previous page. paginationState and sortState should be used together.
When using pagination to gather all search results the paginationState and paginationToken returned in the response to the previous call should be used.

     * @return DocrioModels.SearchPostResponse
     */
    public static DocrioModels.SearchPostResponse postSearch(DocrioModels.SearchPostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/search', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.SearchPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.SearchPostResponse.class);
        }
        return null;
    }

    /**
     * Returns an array of file records which the user has marked as "favorites."
     * Providing a single related salesforce record id, an array of file records will be returned that were marked as "favorites" within the related record.
     * 
     *
     * @param RelatedRecordId A single related salesforce record id.
     * @return DocrioModels.FavoritesGetResponse
     */
    public static DocrioModels.FavoritesGetResponse getFavorites(String RelatedRecordId) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/favorites', null, 'application/json');

        if(response != null) {
            return (DocrioModels.FavoritesGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FavoritesGetResponse.class);
        }
        return null;
    }

    /**
     * Returns folder structure for the given record
     * Providing a record id, an array will return of the file structure for that record. If there is no file structure, an empty array will be returned.
     * 
     *
     * @param Id A single record id.
     * @return Map<String, Object>
     */
    public static Map<String, Object> getFolders(String Id) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/folders', null, 'application/json');

        if(response != null) {
            return (Map<String, Object>)JSON.deserialize(JSON.serialize(response), Map<String, Object>.class);
        }
        return null;
    }

    /**
     * Creates new folder
     * Providing a folder and subfolder path will create a new folder and return successful status
     * 
     *
     * @param requestBody The request payload
     * @return Map<String, Object>
     */
    public static Map<String, Object> postFolders(DocrioModels.FolderPostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/folders', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (Map<String, Object>)JSON.deserialize(JSON.serialize(response), Map<String, Object>.class);
        }
        return null;
    }

    /**
     * Initial job process for downloading folders
     * Providing the fileInfoIds will initial a job process which creates a Zip file of the requested file info Ids.
     * 
     * The presignedUrl is provided to upload the JSON schema for the Zip Job.
     * 
     *
     * @param usePost If using Docrio v10 or later, pass this parameter with a value of "true" .
     * @param requestBody The request payload
     * @return DocrioModels.FolderZipCreatePostResponse
     */
    public static DocrioModels.FolderZipCreatePostResponse postFoldersZipCreate(String usePost, DocrioModels.FolderZipCreatePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/folders/zip/create', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.FolderZipCreatePostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FolderZipCreatePostResponse.class);
        }
        return null;
    }

    /**
     * use to check status of the zip file
     * Providing the job id from zip/create will return the current status for that Zip job.
     * 
     * The status can be "INITIALIZED""PROCESS""COMPLETED""FAILED".
     * 
     * The response will contain a presigned Url to download the Zip file only when the status is "COMPLETED"
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.FolderZipCompletePostResponse
     */
    public static DocrioModels.FolderZipCompletePostResponse postFoldersZipComplete(DocrioModels.FolderZipCompletePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/folders/zip/complete', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.FolderZipCompletePostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.FolderZipCompletePostResponse.class);
        }
        return null;
    }

    /**
     * use to check status of the unzip jobs
     * Providing the job id from /files POST call when isUnzip parameter set to true will return the current status for that Zip job.
     * 
     * The status can be "INITIALIZED""PROCESS""COMPLETED""FAILED""FAILED-ZIP-FILE-SIZE-EXCEEDED""FAILED-UNZIP-FILE-SIZE-EXCEEDED".
     * 
     * The response will contain jobStatuses for each unzip job
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.UnzipStatusPostResponse
     */
    public static DocrioModels.UnzipStatusPostResponse postUnzipStatus(DocrioModels.UnzipStatusPostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/unzip/status', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.UnzipStatusPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.UnzipStatusPostResponse.class);
        }
        return null;
    }

    /**
     * use to unzip existing zip file.
     * Providing single or multiple ids of existing zip files, it will copy existing zip file from Documents bucket to Unzip bucket, which triggers Unzip lambda function.
     * 
     * @return DocrioModels.UnzipExistingPostResponse
     */
    public static DocrioModels.UnzipExistingPostResponse postUnzipExisting() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/unzip/existing', null, 'application/json');

        if(response != null) {
            return (DocrioModels.UnzipExistingPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.UnzipExistingPostResponse.class);
        }
        return null;
    }

    /**
     * Convert files to PDF by record id
     * Providing single or multiple ids of existing Microsoft Excel, PowerPoint, Word and other document type (application/rtf, text/plain, text/csv, application/vnd.wordperfect, application/vnd.ms-outlook, message/rfc822, text/html) file, it will copy existing pdf file from rendition bucket to the Documents bucket.
     * 
     * @return DocrioModels.PdfConvertPostResponse
     */
    public static DocrioModels.PdfConvertPostResponse postPdfConvert() {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/pdf/convert', null, 'application/json');

        if(response != null) {
            return (DocrioModels.PdfConvertPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.PdfConvertPostResponse.class);
        }
        return null;
    }

    /**
     * Get the status of an existing pdf convert job.
     * This endpoint can be used to retrieve the status of an existing convert job by providing the PDFConvertId.
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.PdfConvertCompletePostResponse
     */
    public static DocrioModels.PdfConvertCompletePostResponse postPdfConvertComplete(DocrioModels.PdfConvertCompletePostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/pdf/convert/complete', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.PdfConvertCompletePostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.PdfConvertCompletePostResponse.class);
        }
        return null;
    }


    // Sharing Methods
    /**
     * Returns a preview link for the provided external link information. This action will search within the associated client's pdf rendition bucket.
     * A signed url will be created for the ShareId and FileId provided. The response will contain the signed url along with its expiration time. The signed url is valid for 5 minutes and can be used to upload the file. If the external link is password protected the password needs to be included as a basic authentication header.
     * The username for constructing an authenticated request to this endpoint with is `guest`. In order to use external link preview endpoint you need to use the links from the external link api only.
     * 
     *
     * @param ShareId External Link's unique ID
     * @param FileId SF FileInfo ID for a file record.
     * @return DocrioModels.ExternalLinkPreviewResponse
     */
    public static DocrioModels.ExternalLinkPreviewResponse getExternallinkPreview(String ShareId, String FileId) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/externallink/preview', null, 'application/json');

        if(response != null) {
            return (DocrioModels.ExternalLinkPreviewResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.ExternalLinkPreviewResponse.class);
        }
        return null;
    }

    /**
     * Returns a presinged URL for the provided external link information. This action will search within the associated client's dedicated upload S3 bucket.
     * A signed url will be created for the ShareId and FileId provided. The response will contain the signed url along with its expiration time. The signed url is valid for 5 minutes and can be used to upload the file. If the external link is password protected the password needs to be included as a basic authentication header.
     * The username for constructing an authenticated request to this endpoint with is `guest`. In order to use external link download endpoint you need to use the links from the external link api only.
     * 
     *
     * @param ShareId External Link's unique ID
     * @param FileIds SF FileInfo ID for a file record.
     * @param FileNames SF FileName for a file record.
     * @return DocrioModels.ExternalLinkDownloadResponse
     */
    public static DocrioModels.ExternalLinkDownloadResponse getExternallinkDownload(String ShareId, String FileIds, String FileNames) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/externallink/download', null, 'application/json');

        if(response != null) {
            return (DocrioModels.ExternalLinkDownloadResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.ExternalLinkDownloadResponse.class);
        }
        return null;
    }

    /**
     * Downloads multiple files and folders
     * Provide an array of FileInfoRecords to download, this list must be inclusive of all file records requested regardless of whether or not they appear in the `FileIdsWithFolderPath` object. To include the download of folders, provide the object `FileIdsWithFolderPath`.
     * `FileIdsWithFolderPath` includes objects `files` and `filePathReference`. `files` represents all the file info records that must be downloaded within a folder. `filePathReference` represents the file info record with its corresponding folder name.
     * 
     *
     * @param ShareId External Link's unique ID
     * @param requestBody The request payload
     * @return DocrioModels.ExternalLinkZipResponse
     */
    public static DocrioModels.ExternalLinkZipResponse postExternallinkZip(String ShareId, DocrioModels.ExternalLinkZipRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/externallink/zip', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.ExternalLinkZipResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.ExternalLinkZipResponse.class);
        }
        return null;
    }

    /**
     * Retrieves the status of a previously initiated zip download
     * Provide the ShareId of the external link that was downloaded, with the ZipFileId returned from POST /externallink/zip
     *
     * @param ShareId External Link's unique ID
     * @param ZipFileId ZipFileId of the download request
     * @return DocrioModels.ExternalLinkZipStatusResponse
     */
    public static DocrioModels.ExternalLinkZipStatusResponse getExternallinkZip(String ShareId, String ZipFileId) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/externallink/zip', null, 'application/json');

        if(response != null) {
            return (DocrioModels.ExternalLinkZipStatusResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.ExternalLinkZipStatusResponse.class);
        }
        return null;
    }

    /**
     * Returns external link top level attributes along with associated Record(s) external link information.
     * The response will contain the external link top level attributes along with Record(s) info for the ShareId provided. If the external link is password protected the password needs to be included as a basic authentication header.
     * The username for constructing an authenticated request to this endpoint with is `guest`.
     * If the external link contains shared folders, the response will include a map reference to the structure of the folder
     * 
     *
     * @param ShareId External Link's unique ID
     * @return DocrioModels.ExternalLinkGetResponse
     */
    public static DocrioModels.ExternalLinkGetResponse getExternallink(String ShareId) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('GET', '/externallink', null, 'application/json');

        if(response != null) {
            return (DocrioModels.ExternalLinkGetResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.ExternalLinkGetResponse.class);
        }
        return null;
    }


    // Sharing Management Methods
    /**
     * Creates an external link for the provided FileInfoRecords and corresponding FileLinkRecord information.
     * Providing an array of FileInfoRecords and a FileLinkRecord will generate an external link and return corresponding link information like author, org name, and specific link information like unique id, corresponding Salesforce Id, password protection indication, and expiration date.
     * 
     *
     * @param requestBody The request payload
     * @return DocrioModels.ExternalLinkPostResponse
     */
    public static DocrioModels.ExternalLinkPostResponse postExternallinkCreate(DocrioModels.ExternalLinkPostRequest requestBody) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('POST', '/externallink/create', requestBody != null ? JSON.serialize(requestBody) : null, 'application/json');

        if(response != null) {
            return (DocrioModels.ExternalLinkPostResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.ExternalLinkPostResponse.class);
        }
        return null;
    }

    /**
     * Deletes the External Link associated with the provided LinkId.
     * Providing an External Link Id, the external link will be deleted from S3 and no longer available for any request.
     * 
     *
     * @param LinkId External Link's unique ID
     * @return DocrioModels.ExternalLinkDeleteResponse
     */
    public static DocrioModels.ExternalLinkDeleteResponse deleteExternallink(String LinkId) {
        DocrioClient client = new DocrioClient();
        Map<String, Object> response = client.doCallout('DELETE', '/externallink', null, 'application/json');

        if(response != null) {
            return (DocrioModels.ExternalLinkDeleteResponse)JSON.deserialize(JSON.serialize(response), DocrioModels.ExternalLinkDeleteResponse.class);
        }
        return null;
    }

}
