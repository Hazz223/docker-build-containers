#!/bin/bash

USAGE="Script is used by a Docker container to download a project from a git repo, and run 'clean' 'build' and 'publish'"
REPO=$GIT

while [ "$1" != "" ]; do
    case $1 in
        -h | --help )           echo "$USAGE"
                                exit
                                ;;
        * )                     echo "$USAGE"
                                exit 1
    esac
    shift
done

if [ "$REPO" == "" ]; then
  echo "Git repository must be specified; please pass this as the env arg to docker container: '-e GIT='<repo here>'"
  exit
fi

echo "Starting build"
echo "Will checkout: $REPO"

git clone $REPO project-folder

if [[ ! -e "project-folder" ]]; then
  echo "Should have created project-folder to container repo."
  exit
fi

cd project-folder

if [ ! -e "gradlew" ]; then
    echo "Pulled repo did not have internal gradle wrapper. Please specify repo with one, or use different building container"
    exit
fi

./gradlew clean build publish
./gradlew --stop # needed to kill the container, else daemon will keep it alive

echo "Build finished"
