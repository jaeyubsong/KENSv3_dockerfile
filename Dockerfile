FROM ubuntu:16.04

# Install required tools
RUN apt-get update && apt-get install -y sudo git cmake make gcc g++ libgtest-dev python3 vim

# Make directory for KENS
RUN mkdir /KENSv3

# Move to Google Test Directory
WORKDIR /usr/src/gtest

# With CMake, build Google Test
RUN mkdir /usr/src/gtest/build
WORKDIR /usr/src/gtest/build
RUN cmake ..
RUN make
RUN cp libgtest* /usr/lib
RUN rm -rf ../build

WORKDIR /KENSv3
