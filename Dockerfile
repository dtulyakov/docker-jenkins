FROM jenkins

USER root
RUN set -x \
    && apt-get update \
    && apt-get install -y sudo \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt