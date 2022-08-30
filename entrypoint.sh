#! /bin/bash

GITHUB_REPO=${GITHUB_REPO}
GITHUB_PAT=${GITHUB_PAT}

if [[ -z ${GITHUB_PAT} && -z ${GITHUB_REPO} ]]; then
    echo "GITHUB_REPO and GITHUB_PAT env variables are required"
    exit 1
fi

./config.sh --unattended --url ${GITHUB_REPO} --pat ${GITHUB_PAT} --ephemeral
./run.sh
