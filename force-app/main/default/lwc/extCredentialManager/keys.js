export const CREDENTIAL_KEYS = {
  DocrioApiCredentials: {
    name: "DocrioCredentials",
    principal: "Default",
    keys: [
      {
        name: "client_id",
        label: "Client ID",
        type: "text",
      },
      {
        name: "client_secret",
        label: "Client Secret",
        type: "password",
      },
      {
        name: "username",
        label: "Username",
        type: "text",
      },
      {
        name: "password",
        label: "Password + Security Token",
        type: "password",
      },
      {
        name: "api_key",
        label: "Docrio API Key",
        type: "password",
      },
    ],
  },
};
