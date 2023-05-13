<p align="center">
<a href="https://console.platform.sh/projects/create-project/?template=https://github.com/platformista/medusa/blob/main/template-definition.yaml&utm_campaign=deploy_on_platform?utm_medium=button&utm_source=affiliate_links&utm_content=https://github.com/platformista/medusa/blob/main/template-definition.yaml" target="_blank" title="Deploy with Platform.sh"><img src="https://platform.sh/images/deploy/deploy-button-lg-blue.svg"></a>
</p>

# Medusa.js for Platform.sh

Work in progress. Currently, this only deploys

- [the Medusa backend](https://docs.medusajs.com/development/backend/install) (API)
- [the NextJS storefront](https://docs.medusajs.com/starters/nextjs-medusa-starter)

The [admin application](https://docs.medusajs.com/admin/quickstart) is still missing.

## Seed data

After the first deployment, you might want to seed the database by running `yarn run seed` in the backend container.
To do this, you would ideally have the [Platform.sh CLI](https://github.com/platformsh/cli) installed. 

Then, you may either run

```shell
$ platform ssh "corepack yarn run seed" -p <PROJECT_ID>
```

where `PROJECT_ID` is the ID of the project you just deployed thanks to this template. 

Or you may check out the project and then run a shorter version of the command above:

```shell
$ platform get <PROJECT_ID>
$ cd /path/to/your/project
$ platform ssh "corepack yarn run seed"
```

### Verify data presence

You can request `/store/products` from the backend to verify a list of products is now present. 

### Modifications

- The present setup is [currently ignoring TypeScript typechecking](/blob/main/storefront/next.config.js#L10-L16) in the `storefront` application, because of [this issue](https://github.com/medusajs/medusa/issues/4060).
- In the backend, the `platformsh-config` library is now being used, and `STORE_CORS` is being set using it. My preferred way of doing this would be to do that in `.environment` (see relevant code currently commented out, because something is going wrong there).
- In the frontend, `.environment` has been added as a copy of the `.env` template provided. The `NEXT_PUBLIC_API_URL` is here being set using my preferred way of doing it, which is via bash scripting.