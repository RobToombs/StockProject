Constantly evolving, currently Dockerizing everything to plop it on AWS.

To build front and backend modules for containerizing:\
`npm run build`

Create all images/containers, stop all old running containers and create them from scratch:\
`docker-compose up -d --force-recreate`

Stop and remove all images:\
`docker-compose down --rmi all`

Tagging and Pushing Docker images to repo:\
1. `docker tag stockproject_frontend-ui:latest robtoombs/stockproject:frontend`
2. `docker push robtoombs/stockproject:frontend`
3. `docker tag stockproject_backend-app:latest robtoombs/stockproject:backend`
4. `docker push robtoombs/stockproject:backend`
5. `docker tag alpine:latest robtoombs/stockproject:database`
6. `docker push robtoombs/stockproject:database`

-------------------------------------------------------------------------------------------------------------------
**To start the Webpack Dev Server and Tomcat**
The frontend application will work without the backend/database set up. It will handle requests and responses from the finnhub APIs, but it won't save any searches to the database.

To set up the backend follow the instructions here: **_./backend/DB_instructions.md_**

Windows:\
Run "npm run start-w", to run the frontend/backend independently start up the webpack devServer with "npm run start:frontend" and tomcat with "npm run start:backend-w" or any IDE that supports SpringBoot applications.  

Mac:\
Run "npm run start-m", to run the frontend/backend independently start up the webpack devServer with "npm run start:frontend" and tomcat with "npm run start:backend-m" or any IDE that supports SpringBoot applications.  

Once Tomcat and the Webpack Dev Server are up and running, go to http://localhost:9000/ to check it out.
