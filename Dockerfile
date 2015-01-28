
FROM ubuntu:latest

ADD 02proxy /etc/apt/apt.conf.d/
ADD .wgetrc /root/

RUN sudo apt-get update
RUN sudo apt-get install -y wget

RUN echo "deb http://ppa.launchpad.net/saltstack/salt/ubuntu lsb_release -sc main" > /etc/apt/sources.list.d/saltstack.list
RUN wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -


RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

RUN sudo apt-get update && sudo apt-get upgrade
RUN sudo apt-get install -y salt-master salt-minion salt-syndic

RUN apt-get install -y curl build-essential openssl libssl-dev apache2 libapache2-mod-wsgi libcairo2 supervisor python-cairo libpq5 postgresql python-m2crypto python-virtualenv git python-dev swig libzmq-dev g++ postgresql-9.1 postgresql-server-dev-9.1 libcairo2-dev python-pip libpq-dev ruby debhelper python-mock python-configobj cdbs gem ruby1.9.1 ruby1.9.1-dev make devscripts software-properties-common python-support

