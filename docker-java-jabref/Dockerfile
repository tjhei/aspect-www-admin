FROM tjhei/dealii-base

MAINTAINER timo.heister@gmail.com

USER root

RUN apt-get update && sudo apt-get -yq install \
    software-properties-common

RUN add-apt-repository ppa:openjdk-r/ppa && apt-get update && sudo apt-get -yq install \
    openjdk-8-jre-headless

ADD prefs.xml .java/.userPrefs/net/sf/jabref/
ADD JabRef-3.8.2.jar .
ADD script.sh .

RUN chown bob:bob -R * .*
USER bob

CMD ./script.sh
