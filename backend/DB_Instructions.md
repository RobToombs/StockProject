Notes for reference on setting up/running a local Postgres DB for development. Versions listed are my current version, subject to change.

1. Install Docker (19.03.8), Postgres (12.2), and pgAdmin 4
2. See all Docker containers:\
    `docker container list -a`
3. See all Docker images:\
    `docker image list -a`
4. See currently running Docker containers:\
    `docker ps`
5. Create a container to be used as a volume to store our Postgres data:\
    `docker create -v /var/lib/postgresql/data --name PostgresData alpine`
    
    This creates a container with a Linux Alpine distribution at '/var/lib/postgres/data' named 'PostgresData' which will be used to store our Postgres DB.
    
    More info on `docker create` here: https://docs.docker.com/engine/reference/commandline/create/ 
 
    More info on the `alpine` image here: https://hub.docker.com/_/alpine
    
6. Create a container to run our Postgres DB:\
NOTE: I may screw up the username/password here to better fit our docker images, reference it against the application.yml/docker-compost.yml if things aren't working 

    `docker create -p 5432:5432 --name postgres -e POSTGRES_PASSWORD=admin --volumes-from PostgresData postgres`
    
    This does a few things:\
        1. maps the host (our local machine) port at '5432' to the container port at '5432'\
        2. names the container 'postgres'\
        3. sets the container environment POSTGRES_PASSWORD variable to 'admin'\
        4. mounts the volume we created (named PostgresData) in the previous step for use by our Postgres DB

    More info on the `postgres` image here: https://hub.docker.com/_/postgres
    
7. Start up our Postgres DB:\
    `docker start postgres`
    
    This will start up our container holding the `postgres` database image.
    
8. Once the postgres container has started, we can start up our SpringBoot application.
    
    Viewing/Editing the DB contents can be done in a couple ways:\
        1. Setup your IDE with a postgres data source. The login details are located in our application.yml.\
        2. Run queries in the `psql` command line (login: `psql -d postgres -U postgres`)\
        3. Setup pgAdmin 4 to connect to our postgres server with the details located in our application.yml.