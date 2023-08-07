# github-runner
- My version of GH runner, a little advanced, no big deal

- In order tu start it inside docker, pleas run below script:

```bash

if [[ ${GITHUB_PAT} == "" ]];then
  read -p "Please input GITHUB_PAT: " GITHUB_PAT
  export GITHUB_PAT="${GITHUB_PAT}"
fi
if [[ ${GITHUB_OWNER} == "" ]];then
  read -p "Please input GITHUB_OWNER: " GITHUB_OWNER
  export GITHUB_OWNER="${GITHUB_OWNER}"
fi
if [[ ${GITHUB_REPOSITORY} == "" ]];then
  read -p "Please input GITHUB_REPOSITORY: " GITHUB_REPOSITORY
  export GITHUB_REPOSITORY="${GITHUB_REPOSITORY}"
fi
if [[ ${RUNNER_GROUP} == "" ]];then
  read -p "Please input RUNNER_GROUP: " RUNNER_GROUP
  export RUNNER_GROUP="${RUNNER_GROUP}"
fi
if [[ ${RUNNER_TOKEN} == "" ]];then
  read -p "Please input RUNNER_TOKEN: " RUNNER_TOKEN
  export RUNNER_TOKEN="${RUNNER_TOKEN}"
fi

docker run -d --name sys-github-runner -e GITHUB_PAT=$GITHUB_PAT -e GITHUB_OWNER=$GITHUB_OWNER -e GITHUB_REPOSITORY=$GITHUB_REPOSITORY -e RUNNER_GROUP=$RUNNER_GROUP -e RUNNER_TOKEN=$RUNNER_TOKEN -v /var/run/docker.sock:/var/run/docker.sock lukaspastva/sys-github-runner:latest
```