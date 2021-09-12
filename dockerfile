FROM centos

RUN yum install -y dmidecode
RUN yum install -y lshw
