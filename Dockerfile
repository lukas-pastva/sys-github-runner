FROM docker:23.0.6-dind

# The environment variables necessary for the GitHub Runner
ENV RUNNER_NAME "github-runner"
ENV GITHUB_PAT "<Your PAT>"
ENV RUNNER_WORKDIR "_work"
ENV GITHUB_OWNER "<owner>"
ENV GITHUB_REPOSITORY "<repo>"
ENV RUNNER_GROUP "<group>"
ENV RUNNER_TOKEN "<token>"

RUN apk add --no-cache bc gettext jq unzip zip p7zip curl

# Create a runner directory
RUN mkdir actions-runner && cd actions-runner

# Download the latest version of GitHub Runner
RUN curl -O -L https://github.com/actions/runner/releases/download/v2.307.1/actions-runner-linux-x64-2.307.1.tar.gz

# Extract the runner package
RUN tar xzf ./actions-runner-linux-x64-2.307.1.tar.gz

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
