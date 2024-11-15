# Docker GitHub Runner

## __Instructions for Personal Account__

1. Login to the Personal account

2. Create an __access_token__ for the account and provide __repo__ access

3. Create a `.env` file in the same directory as docker-compose.yml and add the following variables:
    ```
    GITHUB_USERNAME=rickdonato
    GITHUB_REPO=docker-gh-runner
    ACCESS_TOKEN=github-access-token
    ```

4. Run docker-compose yml file
    ```
    docker-compose up --build
    ```


## __Instructions for Organization Account__

1. Login to Organization Admin User

2. Create an __access_token__ for the account and provide __admin:org__ access

3. Create a `.env` file in the same directory as docker-compose.yml and add the following variables:
    ```
    GITHUB_ORGNAME=packetcoders
    ACCESS_TOKEN=github-access-token
    ```

4. Run docker-compose yml file
    ```
    docker-compose up --build
    ```
