<p align="center">
<a href="https://console.platform.sh/projects/create-project/?template=https://github.com/platformista/medusa/blob/main/template-definition.yaml&utm_campaign=deploy_on_platform?utm_medium=button&utm_source=affiliate_links&utm_content=https://github.com/platformista/medusa/blob/main/template-definition.yaml" target="_blank" title="Deploy with Platform.sh"><img src="https://platform.sh/images/deploy/deploy-button-lg-blue.svg"></a>
</p>

# Medusa.js for Platform.sh - Based on https://docs.medusajs.com/usage/create-medusa-app

Work in progress. Currently only deploys the backend (API) application.

### Seed data

After the first deployment, grab the project ID from the Platform.sh project and run the following command to populate the database with products: 

```
platform ssh "corepack yarn run seed" -p <PROJECT_ID>
```

After this, requesting `/store/products` will yield a list of products. 