FROM centos

RUN yum install sudo -y
RUN yum install net-tools -y
RUN yum install NetworkManager -y
RUN yum install util-linux -y
