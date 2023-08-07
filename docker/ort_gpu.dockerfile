# use version with CUDA 11.8 and TensorRT 8.5.1.7 to match ORT 1.14 requirements
FROM nvcr.io/nvidia/tensorrt:22.12-py3

# Ignore interactive questions during `docker build`
ENV DEBIAN_FRONTEND noninteractive

# Install and update tools to minimize security vulnerabilities
RUN apt-get update
RUN apt-get install -y software-properties-common wget apt-utils patchelf git libprotobuf-dev protobuf-compiler cmake \
    bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 mercurial subversion libopenmpi-dev && \
    apt-get clean
RUN unattended-upgrade
RUN apt-get autoremove -y

RUN python -m pip install -U pip

CMD ["/bin/bash"]