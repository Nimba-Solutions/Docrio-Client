import { LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import saveCredentialValues from "@salesforce/apex/CredentialManagerController.saveCredentialValues";
import { CREDENTIAL_KEYS } from "./keys";

export default class ExtCredentialManager extends LightningElement {
  credentialValues = {};

  connectedCallback() {
    // Initialize credentialValues with empty strings for each credential's keys
    Object.values(CREDENTIAL_KEYS).forEach((cred) => {
      cred.keys.forEach((field) => {
        if (!this.credentialValues[cred.name]) {
          this.credentialValues[cred.name] = {};
        }
        this.credentialValues[cred.name][field.name] = "";
      });
    });
  }

  get externalCredentials() {
    return Object.values(CREDENTIAL_KEYS).map((cred) => ({
      ...cred,
      keys: cred.keys.map((field) => ({
        ...field,
        value: this.credentialValues[cred.name]?.[field.name] || "",
      })),
    }));
  }

  handleInputChange(event) {
    const field = event.target.name;
    const value = event.target.value;
    const credName =
      event.target.closest("[data-credential]").dataset.credential;

    if (!this.credentialValues[credName]) {
      this.credentialValues[credName] = {};
    }
    this.credentialValues[credName][field] = value;
  }

  async handleSubmit(event) {
    event.preventDefault();
    try {
      // Save credentials for each External Credential
      for (const credName in this.credentialValues) {
        await saveCredentialValues({
          externalCredentialName: credName,
          principalName: CREDENTIAL_KEYS[credName].principal,
          credentialValues: this.credentialValues[credName],
        });
      }

      this.dispatchEvent(
        new ShowToastEvent({
          title: "Success",
          message: "Credentials saved successfully",
          variant: "success",
        })
      );
    } catch (error) {
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error saving credentials",
          message: error.body?.message || "Unknown error occurred",
          variant: "error",
        })
      );
    }
  }

  // Replace handleUpdate with handleSubmit since we're using the same method
  handleUpdate = function (event) {
    return this.handleSubmit(event);
  };
}
