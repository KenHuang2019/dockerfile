# Use Ubuntu:18.04 image as parent image
FROM ubuntu:18.04

# set the workspace directory
WORKDIR /

# Install necessary library
RUN apt-get update
RUN apt-get -y install git curl zip
RUN apt-get -y install python3-pip python3-dev
RUN apt-get -y install build-essential libssl-dev libffi-dev
RUN apt-get -y install lib32z1 libglib2.0-dev libsm6 libxrender1 libxext6 libice6 libxt6 libfontconfig1 libcups2 libgl1-mesa-glx

RUN pip3 install --upgrade pip
RUN pip3 install numpy scipy matplotlib pillow
RUN pip3 install opencv-python