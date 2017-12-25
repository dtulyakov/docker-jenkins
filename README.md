[![Build Status](https://travis-ci.org/dtulyakov/docker-jenkins.svg?branch=master)](https://travis-ci.org/dtulyakov/docker-jenkins)
[![Docker Pulls](https://img.shields.io/docker/pulls/dtulyakov/jenkins.svg)][hub]

[hub]: https://hub.docker.com/r/dtulyakov/jenkins/

```BASH
docker build --force-rm --no-cache --tag=dtulyakov/jenkins:latest . \
  && docker create --restart=always \
     --network=host \
     --name=Jenkins \
     --env=TRY_UPGRADE_IF_NO_MARKER=true \
     --volumes-from=$(readlink -f /var/run/docker.sock):$(readlink -f /var/run/docker.sock) \
     --volumes-from=$(which docker):$(which docker) \
     --volumes-from=jenkins_home:/var/jenkins_home \
     dtulyakov/jenkins \
  && docker start Jenkins

```

*Выдрать установленные плагины*
```BASH
JENKINS_HOST=username:password@jenkinshost:port
curl -sSL "http://$JENKINS_HOST/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'|sed 's/ /:/'
```

*Ещё полезные плагины:*
- ansible
- blueocean
- xunit
- parameterized-trigger
- simple-theme-plugin
