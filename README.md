## Instructions


1. Login to Organization Admin User

2. Create an __access_token__ for the account and provide __admin:org__ access

3. Populate the below inside docker-compose.yml file with the actual values  
    ```
    GITHUB_ORGNAME=packetcoders  
    ACCESS_TOKEN=github-access-token  
    ```

4. Run docker-compose yml file
    ```
    docker-compose up --build
    ```