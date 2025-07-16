import { LightningElement, api } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import saveCredentialValues from "@salesforce/apex/CredentialManagerController.saveCredentialValues";
import updateCredentialValues from "@salesforce/apex/CredentialManagerController.updateCredentialValues";
import { CREDENTIAL_KEYS } from "./keys";

export default class CredentialManager extends LightningElement {
  @api externalCredentialName = "DocrioApiCredentials";
  @api principalName = "DocrioUser";

  credentialValues = {};
  _fields = CREDENTIAL_KEYS.keys;

  connectedCallback() {
    // Initialize credentialValues with empty strings for each key
    this._fields.forEach((field) => {
      this.credentialValues[field.name] = "";
    });
  }

  get fields() {
    return this._fields.map((field) => ({
      ...field,
      value: this.credentialValues[field.name] || "",
    }));
  }

  handleInputChange(event) {
    const field = event.target.name;
    const value = event.target.value;
    this.credentialValues[field] = value;
  }

  async handleSubmit(event) {
    event.preventDefault();
    try {
      await saveCredentialValues({
        externalCredentialName: this.externalCredentialName,
        principalName: this.principalName,
        credentialValues: this.credentialValues,
      });

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

  async handleUpdate(event) {
    event.preventDefault();
    try {
      await updateCredentialValues({
        externalCredentialName: this.externalCredentialName,
        principalName: this.principalName,
        credentialValues: this.credentialValues,
      });

      this.dispatchEvent(
        new ShowToastEvent({
          title: "Success",
          message: "Credentials updated successfully",
          variant: "success",
        })
      );
    } catch (error) {
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error updating credentials",
          message: error.body?.message || "Unknown error occurred",
          variant: "error",
        })
      );
    }
  }
}
