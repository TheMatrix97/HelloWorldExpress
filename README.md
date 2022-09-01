# Hello world App

Hello world Express Application. Written to be used in a Docker course about how to optimize Dockerfiles.

Use the base `master` branch to follow the contents of the course, you will find the final solution in the `solved` branch.
## Execute the app

`docker build -t hello-world-express:latest .`

`docker run --init --rm -it -p 3000:3000 hello-world-express:latest`