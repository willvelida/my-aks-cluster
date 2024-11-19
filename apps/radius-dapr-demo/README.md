# Demo Notes

## Running our app with Dapr locally

**Make sure Dapr and MongoDB are running in Docker!**

API Project command:

```bash
dapr run --app-id album-catalog-api --resources-path ../../components/ --app-port 5095 -- dotnet run --launch-profile http
```

UI Project command:

```
dapr run --app-id album-catalog-ui --app-port 5108 -- dotnet run --launch-profile http
```

Show component file and run locally!

Navigate to Radius Bicep file

Run the following:

```bash
rad run app.bicep
```

Navigate to Gateway URL and show demo

Show radius dashboard

Show remote Azure Storage account table.

Wrap up and breathe 😊