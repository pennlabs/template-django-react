# Combined (Django + React) Template

This template repo contains the basic configuration needed to create a combined Django and React project.

## Installation

Click the green "Use this template" button and make a new repo with your desired name. Run the provided init script `./init.sh <name of project> <name of github repo>` to configure most of the project. See the configuration section for final changes that need to be made. Then, run [create next app](https://github.com/zeit/next.js#quick-start) in the `frontend` directory.

## Features

* CircleCI
  * Workflow to test, build, publish, and deploy your project using contexts to keep secrets safe
* Docker
  * .dockerignore file to prevent unnecessary files from being added to the docker images
  * Dockerfile to create a docker images to run your project
* Git
  * .gitignore file to prevent common unnecessary files from being committed
* MIT License

## Configuration

Edit the values in `k8s/values.yml` to reflect the domains of your frontend and backend as well as any secrets it needs.
Additionally provide a description of the project in `README.md`
