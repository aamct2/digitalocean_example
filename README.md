# foo

Simple single-page React app served up by nginx in a Docker container.

## Dependencies

- Docker
- Node
- yarn

## Local Development

Run `yarn install` to fetch the Node dependencies. You can either run `yarn start` to run fully locally or `make dev` to run locally within a Docker container.

## Deployment

If you haven't previously, create a [personal access token][do-access] for DigitalOcean. Then make a copy of the `.env.template` file, add in your new access token, and rename to `.env`. This will be used by the Makefile for connecting to DigitalOcean.

## Instantiation

Create an instance on DigitalOcean using

```bash
make create-droplet
```

To verify your Droplet is up and running, use

```bash
make env-droplet
```

## Deploy

If you're not already connected, run the following command. Note that `spa-test` is the `project_name` variable that is defined in the Makefile. It allows us to correctly identify which docker machine to connect to.

```bash
eval $(docker-machine env spa-test)
```

Then to deploy, run

```bash
make start
```

### Clean up

To clean up your Docker container (but not the Droplet), run

```bash
make clean
```

To destroy your Droplet on DigitalOcean, run

```bash
make clean-droplet
```

## Troubleshooting

To check what Droplets you currently have access to and what their current state is, use

```bash
make ls-droplet
```

<!-- Links -->

[do-access]: https://www.digitalocean.com/docs/api/create-personal-access-token/
