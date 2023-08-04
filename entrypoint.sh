#!/bin/bash

# Configure the runner
RUN ./config.sh --url https://github.com/${GITHUB_OWNER}/${GITHUB_REPOSITORY} --token ${GITHUB_PAT} --runnergroup ${RUNNER_GROUP} --name ${RUNNER_NAME} --work ${RUNNER_WORKDIR}

# Run the installation script
RUN ./bin/installdependencies.sh

# finally start runner
cd actions-runner
./runsvc.sh
