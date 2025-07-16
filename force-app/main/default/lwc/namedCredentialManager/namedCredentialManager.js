import { LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NAMED_CREDENTIALS } from "./keys";
import getOrgInfo from "@salesforce/apex/DocrioClient.getOrgInfo";
import updateNamedCredentialEndpoint from "@salesforce/apex/ExternalCredentialService.updateNamedCredentialEndpoint";

export default class NamedCredentialManager extends LightningElement {
  credentials = NAMED_CREDENTIALS.credentials;
  endpointUrls = {};
  loading = true;
  error = null;

  async connectedCallback() {
    try {
      // Get the org info which contains the URL
      const orgInfo = await getOrgInfo();
      const newUrl = orgInfo.url;

      if (!newUrl) {
        throw new Error("No URL returned from org info");
      }

      // Initialize the URLs map
      this.credentials.forEach((cred) => {
        this.endpointUrls[cred.name] = {
          currentUrl: "", // Will be populated when we implement getCurrentUrl
          newUrl: newUrl,
        };
      });

      this.loading = false;
    } catch (error) {
      this.error = error.message;
      this.loading = false;
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error Loading URLs",
          message: error.message,
          variant: "error",
        })
      );
    }
  }

  async handleUpdate(event) {
    const credName = event.target.dataset.credential;
    const urlInfo = this.endpointUrls[credName];

    if (!urlInfo || !urlInfo.newUrl) {
      return;
    }

    try {
      await updateNamedCredentialEndpoint({
        namedCredentialName: credName,
        newEndpointUrl: urlInfo.newUrl,
      });

      this.dispatchEvent(
        new ShowToastEvent({
          title: "Success",
          message: `Updated ${credName} endpoint URL`,
          variant: "success",
        })
      );

      // Update the current URL in our state
      this.endpointUrls[credName].currentUrl = urlInfo.newUrl;
    } catch (error) {
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error Updating URL",
          message: error.message,
          variant: "error",
        })
      );
    }
  }

  get hasCredentials() {
    return this.credentials && this.credentials.length > 0;
  }

  get credentialList() {
    return this.credentials.map((cred) => ({
      ...cred,
      currentUrl: this.endpointUrls[cred.name]?.currentUrl || "",
      newUrl: this.endpointUrls[cred.name]?.newUrl || "",
    }));
  }
}
