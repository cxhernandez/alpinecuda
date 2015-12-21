# Start with Alpine base image
FROM alpine:latest

# download cuda
RUN apk update && apk add wget && \
    wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run && \
    chmod +x cuda_*_linux.run && \
    ./cuda_*_linux.run --tar mxvf && \
    RUN rm -rf cuda_*_linux.run \
           /run_files \
           InstallUtils.pm \
           cuda-installer.pl \
           uninstall_cuda.pl

# Add to path
ENV PATH=/usr/local/cuda/bin:$PATH LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

           
