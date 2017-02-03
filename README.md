# Docker Build Containers

Simple project to use Docker Containers as a way of building projects.

## Usage

Clone the project, and run `docker build -t gradle-build:latest .` which will build the container.
To run the container, use `docker run gradle-build -e GIT='<whatever your repo is>'`

Your project will need to have an internal gradle wrapper, as well as the functionality to publish to a repo via the
Maven Publish Plugin provided by gradle.

## About

This project exists to try out a build process using containers to build projects.
Future ideas:
- Build docker image and publish to a Docker Repo instead of the creating a jar and publishing that
- Work out if this can work with Jenkins build process in some form.
