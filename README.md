# Hexagon Deployment

This repository contains a docker compose configuration to deploy all hexagon services.

## Getting Started

To set up this project, it is advisable to use Docker. Please refer to [this guide](https://docs.docker.com/get-started/get-docker/) on how to install it.

Verify that docker is installed:

```
docker --version
```

Clone this project onto your machine:

```
git clone --recurse-submodules --shallow-submodules https://github.com/hexis-revival/hexagon-deploy.git
```

Copy the `.example.env` file to a new `.env` file and **edit it**.

Start the server:

```
docker compose up -d
```

("-d" argument means detached, meaning that containers will run in background)

To turn off the server, from the root project folder, execute:

```
docker compose stop
```

If you experience issues on the first run, you may need to restart your containers:

```
docker compose restart
```

If you changed some files around, and don't see your changes applied, execute:

```
(rebuild)
docker compose build
(apply changes & restart affected containers)
docker compose up -d
```

## Updating

This project will get updates from time to time, so it's a good idea to apply them once in a while.

Start by first pulling all pending changes into your root folder:

```
git pull
```

After that update all of your submodules:

```
git submodule update --recursive
```

Finally, rebuild and restart all of your containers:

```
docker compose build
docker compose up -d
```