# dockerExample

## Create a Docker image and test locally

1. Install Docker Desktop, if not already installed and ensure it is running:  
   https://www.docker.com/products/docker-desktop/
1. Clone this repository:
   `git clone https://github.com/entizer/public-morpheus-automation-examples`
2. Navigate to the `Kubernetes/dockerExample` directory via the command line:
3. Run the following command to build the image:   
   `docker build -t dockerexample:latest .`
5. Information on the Docker image can be seen by running the following command:
   `docker images`
6. Test that the image runs locally:  
   `docker run -d -p 8080:80 --name webserver dockerexample:latest`
7. Navigate to the running image via the web browser:  
   http://localhost:8080/
8. Cleanup the running image:  
   `docker stop webserver`  
   `docker rm webserver`

# Push the Docker image to the Docker Hub

At this point, your image is created.  However, you'll want to host this image somewhere so it can be used.  Uploading it to the Docker registry is the method that will be used here, use a different location if needed.

1. Create a Docker account if you do not already have one:  
   https://www.docker.com/
2. Login to Docker:  
   `docker login`
3. If not already there, navigate to the `Kubernetes/dockerExample` directory
3. Build the previous image again but this time with your username before the imagename, example:  
   `docker build -t entizer/dockerexample:latest .`
4. Information on the Docker image can be seen by running the following command:  
   `docker images`
5. Finally, push the image to your Docker Hub:  
   `docker push entizer/dockerexample:latest`
6. You should now have a repository created in Docker Hub and your tagged image of `latest` available to be used in projects