# Tinkerpop Rexster Server
#

FROM centos

# Install unzip so we later can unpack
RUN yum install -y java unzip

ADD http://tinkerpop.com/downloads/rexster/rexster-server-2.6.0.zip /
RUN unzip rexster-server-2.6.0.zip
RUN rm rexster-server-2.6.0.zip
RUN mv rexster-server-2.6.0 rexster-server

# Server listening port
EXPOSE 8182

# RexPro port
EXPOSE 8184

# Shutdown listener port
EXPOSE 8183
WORKDIR rexster-server

## Entrypoint
ENTRYPOINT ["bin/rexster.sh", "--start"]
