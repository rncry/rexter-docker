# Tinkerpop Rexster Server
#

FROM centos

# Install unzip so we later can unpack
RUN yum install -y java unzip

ADD http://s3.thinkaurelius.com/downloads/titan/titan-0.5.3-hadoop2.zip /
RUN unzip titan-0.5.3-hadoop2.zip
RUN rm titan-0.5.3-hadoop2.zip
RUN mv titan-server-0.5.3 /opt/
RUN ln -s /opt/titan-server-0.5.3 /opt/titan

ADD titan-cassandra.properties /opt/titan/conf/titan-cassandra.properties
ADD rexter-cassandra.xml /opt/titan/rexhome/config/rexter-cassandra.xml

# Server listening port
EXPOSE 8182

# RexPro port
EXPOSE 8184

# Shutdown listener port
EXPOSE 8183
WORKDIR /opt/titan

## Entrypoint
ENTRYPOINT ["bin/rexster.sh", "--start", "-c", "/opt/titan/rexhom/config/rexter-cassandra.xml"]
