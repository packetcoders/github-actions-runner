#!/bin/bash

GITHUB_ORGNAME=$GITHUB_ORGNAME
GITHUB_USERNAME=$GITHUB_USERNAME
GITHUB_REPO=$GITHUB_REPO
ACCESS_TOKEN=$ACCESS_TOKEN


organization_profile_registration () {

    REG_TOKEN=$(curl -sX POST -H "Accept: application/vnd.github+json" -H "Authorization: Bearer ${ACCESS_TOKEN}" https://api.github.com/orgs/${GITHUB_ORGNAME}/actions/runners/registration-token | jq .token --raw-output)

    cd /home/docker/actions-runner

    ./config.sh --url https://github.com/${GITHUB_ORGNAME} --token ${REG_TOKEN}

    cleanup() {
        echo "Removing runner..."
        ./config.sh remove --unattended --token ${REG_TOKEN}
    }

    trap 'cleanup; exit 130' INT
    trap 'cleanup; exit 143' TERM

    ./run.sh & wait $!

}

personal_profile_registration () {

    REG_TOKEN=$(curl -sX POST -H "Accept: application/vnd.github+json" -H "Authorization: Bearer ${ACCESS_TOKEN}" https://api.github.com/repos/${GITHUB_USERNAME}/${GITHUB_REPO}/actions/runners/registration-token | jq .token --raw-output)

    cd /home/docker/actions-runner

    ./config.sh --url https://github.com/${GITHUB_USERNAME}/${GITHUB_REPO} --token ${REG_TOKEN}

    cleanup() {
        echo "Removing runner..."
        ./config.sh remove --unattended --token ${REG_TOKEN}
    }

    trap 'cleanup; exit 130' INT
    trap 'cleanup; exit 143' TERM

    ./run.sh & wait $!
}

export PATH=$PATH:/home/docker/.local/
if [[ -z "$GITHUB_ORGNAME" ]]
then
    personal_profile_registration
else
    organization_profile_registration
fi
