include .env

## Aliases ###################

COMPOSE := $(shell which docker-compose)
DOCKER := $(shell which docker)
MACHINE := $(shell which docker-machine)


## Variables #################

project_name := spa-test


## Development ###############

default: dev

dev: clean start

clean:
	$(COMPOSE) down
.PHONY: clean

start:
	$(COMPOSE) up -d
.PHONY: start


## Production #################

create-droplet:
	$(MACHINE) create --driver digitalocean --digitalocean-access-token ${DO_ACCESS} $(project_name)
.PHONY: create-droplet

env-droplet:
	$(MACHINE) env $(project_name)
.PHONY: env-droplet

ls-droplet:
	$(MACHINE) ls
.PHONY: ls-droplet

clean-droplet:
	$(MACHINE) stop $(project_name)
	$(MACHINE) rm -y $(project_name)
.PHONY: clean-droplet
