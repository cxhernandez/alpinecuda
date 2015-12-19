# Start with Alpine base image
FROM alpine:latest

# Install wget and bash
RUN apk update && apk add wget bash

# download cuda
RUN wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run

# Make the run file executable and extract
RUN chmod +x cuda_*_linux.run
RUN ./cuda_*_linux.run --tar mxvf

# Add to path
ENV PATH=/usr/local/cuda/bin:$PATH LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
