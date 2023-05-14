<p align="center">
<a href="https://console.platform.sh/projects/create-project/?template=https://github.com/platformista/medusa/blob/main/template-definition.yaml&utm_campaign=deploy_on_platform?utm_medium=button&utm_source=affiliate_links&utm_content=https://github.com/platformista/medusa/blob/main/template-definition.yaml" target="_blank" title="Deploy with Platform.sh"><img src="https://platform.sh/images/deploy/deploy-button-lg-blue.svg"></a>
</p>

# Medusa for Platform.sh

- [Medusa](https://medusajs.com) Medusa is an open-source commerce solution, offering reusable modules for bespoke applications, leveraging modern tech for scalability and control, ideal for brands seeking customisation and innovation.
- [Platform.sh](https://platform.sh) is a horizontal polyglot PaaS that offers a unified, secure, enterprise-grade solution for responsibly building, running, and scaling fleets of websites and applications.

## Template

Platform.sh template offer a way to one-click install a working installation of an application or collection of applications. 

This template deploys:

- [The Medusa Backend](https://docs.medusajs.com/development/backend/install)
- [The Admin Dashboard](https://docs.medusajs.com/admin/quickstart)
- [The Next.js Storefront](https://docs.medusajs.com/starters/nextjs-medusa-starter)

## Seed data

After the first deployment, you might want to seed the database by running `yarn run seed` in the backend container.
To do this, you would ideally have the [Platform.sh CLI](https://github.com/platformsh/cli) installed. 

Then, you may run

```shell
$ platform ssh "corepack yarn run seed" -p <PROJECT_ID>  -e main -A backend
```

where `<PROJECT_ID>` is the unique identifier of the project you just deployed thanks to this template. You can access that information via the CLI or the Web Console. 

### Verify data presence

You can request `/store/products` from the backend to verify a list of products is now present.

## Access the Admin Dashboard

The dashboard is installed as plugin of the backend, and will be available at `/app` on the same domain as the backend.

If you installed the demo data as per above, you may now log in with the following credentials:

- email: `admin@medusa-test.com`
- password: `supersecret`

### Create a new user

To create a new admin user from the command line, run the following command in the directory holding your Medusa backend:

```shell
$ platform ssh "corepack yarn run medusa user -e some@email.com -p some-password" -p <PROJECT_ID>  -e main -A backend
```

This will create a new user that you can use to log into your admin panel.

## Special notes

- The present setup is [currently ignoring TypeScript typechecking](/blob/main/storefront/next.config.js#L10-L16) in the `storefront` application, because of [this issue](https://github.com/medusajs/medusa/issues/4060).
- In the backend, the `platformsh-config` library is now being used, and `STORE_CORS` is being set using it. My preferred way of doing this would be to do that in `.environment` (see relevant code currently commented out, because something is going wrong there).
- In the frontend, `.environment` has been added as a copy of the `.env` template provided. The `NEXT_PUBLIC_API_URL` is here being set using my preferred way of doing it, which is via bash scripting.
