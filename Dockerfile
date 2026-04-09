# ------------------------------
# Volatility 2 Sandbox Dockerfile
# ------------------------------
FROM ubuntu:22.04

# Set noninteractive mode to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies and Python 2 from deadsnakes
RUN apt-get update && \
    apt-get install -y software-properties-common curl && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
        python2 \
        python2-dev \
        python2-minimal \
        python-pip \
        git \
        build-essential \
        libdistorm3-dev \
        yara \
        && rm -rf /var/lib/apt/lists/*

# Set python2 as default python
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 1

# Clone Volatility 2 repository
RUN git clone https://github.com/volatilityfoundation/volatility.git /opt/volatility

WORKDIR /opt/volatility

# Install Volatility requirements
RUN pip install --upgrade pip && pip install -r requirements.txt

# Use JSON form ENTRYPOINT to avoid OS signal issues
ENTRYPOINT ["python", "vol.py"]

# Default command (just print help)
CMD ["--info"]