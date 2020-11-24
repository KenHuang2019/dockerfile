# Use Ubuntu:18.04 image as parent image
FROM ubuntu:18.04

# set the workspace directory
WORKDIR /

# Install necessary library
RUN apt-get update
RUN apt-get -y install git curl zip unzip cmake pkg-config
RUN apt-get -y install python3-pip python3-dev
RUN apt-get -y install build-essential libssl-dev libffi-dev
RUN apt-get -y install lib32z1 libglib2.0-dev libsm6 libxrender1 libxext6 libice6 libxt6 libfontconfig1 libcups2 libgl1-mesa-glx

RUN apt-get -y install libjpeg-dev libpng-dev libtiff-dev
RUN apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
RUN apt-get -y libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran

RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.0.0.zip
RUN wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.0.0.zip
RUN unzip opencv.zip
RUN unzip opencv_contrib.zip
RUN opencv-4.0.0 opencv
RUN opencv_contrib-4.0.0 opencv_contrib

RUN cd ./opencv
RUN mkdir build
RUN cd ./build
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=OFF \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	-D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python \
	-D BUILD_EXAMPLES=ON ..

RUN make -j8
RUN make install
RUN ldconfig

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

RUN pip3 install --upgrade pip
RUN pip3 install numpy scipy matplotlib pillow
RUN pip3 install opencv-python dlib
