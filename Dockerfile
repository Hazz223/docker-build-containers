FROM openjdk:8-jdk
MAINTAINER "Harry Winser - harrywinser@hotmail.co.uk"

COPY build-script.sh /build-script.sh

CMD ["/bin/bash","build-script.sh"]
