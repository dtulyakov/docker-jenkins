[![Build Status](https://travis-ci.org/dtulyakov/docker-jenkins.svg?branch=master)](https://travis-ci.org/dtulyakov/docker-jenkins)
[![Code Climate](https://codeclimate.com/github/dtulyakov/docker-jenkins/badges/gpa.svg)](https://codeclimate.com/github/dtulyakov/docker-jenkins)

```BASH
docker build --force-rm --no-cache --tag=dtulyakov/jenkins:latest . \
  && docker create --restart=always --name=Jenkins \
     --volumes-from=/var/run/docker.sock:/var/run/docker.sock \
     --volumes-from=$(which docker):/usr/bin/docker -p 8080:8080 dtulyakov/jenkins \
  && docker start TZabbix

```
