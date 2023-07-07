FROM centos:centos7
#FROM  --platform=linux/amd64 centos:centos7 
WORKDIR /usr/app

RUN yum update -y && \
    yum install -y python3 iputils unzip java-11-openjdk java-11-openjdk-devel wget && \
    python3 -m pip install --upgrade pip configobj && \
    yum clean all


WORKDIR /usr/app/caen_hvps/
COPY caen_hvps/hvps .

# install dependencies
COPY requirements ./requirements
RUN python3 -m pip install --no-cache-dir -r requirements/docker.txt

COPY caen_hvps/caenlib ./caenlib

WORKDIR /usr/app/caen_hvps/caenlib/
RUN tar -xzf CAENHVWrapper-6.3.tgz 
RUN rm CAENHVWrapper-6.3.tgz

WORKDIR /usr/app/caen_hvps/caenlib/CAENHVWrapper-6.3/
RUN ./install.sh && \
    rm *.txt && \
    rm -rf HVWrapperDemo/


ENV LD_LIBRARY_PATH="/usr/lib"


WORKDIR /usr/app/caen_hvps/


