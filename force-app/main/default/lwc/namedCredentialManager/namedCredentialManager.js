import { LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NAMED_CREDENTIALS } from "./keys";
import getCurrentEndpoint from "@salesforce/apex/CredentialManagerController.getCurrentEndpoint";
import updateNamedCredentialEndpoint from "@salesforce/apex/CredentialManagerController.updateNamedCredentialEndpoint";

export default class NamedCredentialManager extends LightningElement {
  credentials = NAMED_CREDENTIALS.credentials;
  endpointUrls = {};
  loading = true;
  error = null;

  async connectedCallback() {
    try {
      // Get current endpoints for each credential
      for (const cred of this.credentials) {
        const currentUrl = await getCurrentEndpoint({
          namedCredentialName: cred.name,
        });
        this.endpointUrls[cred.name] = currentUrl;
      }
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

  handleUrlChange(event) {
    const credName = event.target.dataset.credential;
    const newUrl = event.target.value;
    this.endpointUrls[credName] = newUrl;
  }

  async handleUpdate(event) {
    const credName = event.target.dataset.credential;
    const newUrl = this.endpointUrls[credName];

    if (!newUrl) {
      return;
    }

    try {
      await updateNamedCredentialEndpoint({
        namedCredentialName: credName,
        newEndpointUrl: newUrl,
      });

      this.dispatchEvent(
        new ShowToastEvent({
          title: "Success",
          message: `Updated ${credName} endpoint URL`,
          variant: "success",
        })
      );
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
      currentUrl: this.endpointUrls[cred.name] || "",
    }));
  }
}
