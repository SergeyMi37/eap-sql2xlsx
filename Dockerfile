ARG IMAGE=containers.intersystems.com/intersystems/irishealth-ml-community:2023.2.0.200.0
#ARG IMAGE=containers.intersystems.com/intersystems/irishealth-ml-community:2023.2.0.202.0
#ARG IMAGE=intersystemsdc/irishealth-ml-community
FROM $IMAGE

USER root   
RUN pip3 install --target /usr/irissys/mgr/python/ openpyxl
RUN apt-get update && apt-get -y install git
WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
USER ${ISC_PACKAGE_MGRUSER}

COPY  src src
COPY module.xml module.xml
COPY iris.script /tmp/iris.script

RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly
