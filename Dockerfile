# Base image
FROM ubuntu:22.04

# Metadata
LABEL maintainer="yourname@example.com"
LABEL description="EasyBuild HPC environment"

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    python3 \
    python3-pip \
    python3-venv \
    lmod \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up EasyBuild in a virtual environment
RUN python3 -m venv /opt/easybuild-venv && \
    /opt/easybuild-venv/bin/pip install --upgrade pip && \
    /opt/easybuild-venv/bin/pip install easybuild

# Add EasyBuild to PATH
ENV PATH="/opt/easybuild-venv/bin:$PATH"

# Create directories for builds and software
RUN mkdir -p /easybuild/software /easybuild/build /easybuild/ebfiles

# Set environment variables
ENV EASYBUILD_BUILDPATH=/easybuild/build
ENV EASYBUILD_INSTALLPATH_SOFTWARE=/easybuild/software
ENV EASYBUILD_ROBOT_PATHS=/easybuild/ebfiles
ENV MODULEPATH=/usr/share/lmod/lmod/modulefiles/Core

# Set workdir
WORKDIR /easybuild

# Entry point
CMD ["bash"]
