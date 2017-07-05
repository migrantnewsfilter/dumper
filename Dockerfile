FROM debian

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.2 main" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

RUN apt-get update && apt-get install -y mongodb-org-tools python python-pip
RUN pip install awscli

ADD dump.sh . && chmod +x dump.sh

RUN mkdir ~/.aws
ADD config ~/.aws

ENTRYPOINT ["/bin/bash", "./dump.sh"]
