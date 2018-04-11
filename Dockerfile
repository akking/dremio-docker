FROM centos:latest
MAINTAINER lmangani <lorenzo.mangani@gmail.com>

# PRE-Requirements
RUN yum install -y nano cronie wget sudo initscripts; yum clean all

RUN useradd -ms /bin/bash  dremio

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jre-8u131-linux-x64.rpm \
 && yum localinstall -y jre-8u131-linux-x64.rpm && rm -rf jre*.rpm; yum clean all

RUN wget http://download.dremio.com/community-server/1.4.9-201802191836310213-7195059/dremio-community-1.4.9-201802191836310213_7195059_1.noarch.rpm \
 && yum localinstall -y dremio*.rpm \
 && rm -rf dremio*.rpm

RUN chkconfig --level 3456 dremio on
 
COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 9047
ENTRYPOINT ["/run.sh"]
