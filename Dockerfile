FROM debian

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.2 main" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

RUN apt-get update && apt-get install -y mongodb-org-tools cron python python-pip

RUN pip install awscli

RUN mkdir /dumps && mkdir /scripts

ADD create-cron.sh /scripts
ADD dump.sh /scripts
RUN chmod +x /scripts/dump.sh

ADD dump /etc/cron.d/dump

RUN mkdir ~/.aws
ADD config ~/.aws

RUN crontab /etc/cron.d/dump

ENTRYPOINT ["/bin/bash", "/scripts/create-cron.sh"]
