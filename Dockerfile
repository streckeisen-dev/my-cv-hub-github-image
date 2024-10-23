# Use an official Ubuntu base image
FROM ubuntu:22.04

# Set environment variables to prevent interactive prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary tools and dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    software-properties-common \
    && add-apt-repository ppa:openjdk-r/ppa -y \
    && apt-get update && apt-get install -y openjdk-21-jdk \
    && apt-get install -y python3-pip \
    && apt-get install -y nodejs npm \
    && npm install -g n \
    && n 21.0.0 \
    && apt-get install -y nodejs \
    && pip3 install pyyaml \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Verify installations
RUN java -version && python3 --version && node -v

# Set the default workdir
WORKDIR /workspace

# Set default shell
CMD ["/bin/bash"]