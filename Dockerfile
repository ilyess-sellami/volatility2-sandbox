# Dockerfile for volatility2-sandbox
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    python2 \
    python2-dev \
    python-pip \
    git \
    build-essential \
    libdistorm3-dev \
    yara \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages for Volatility 2
RUN pip2 install --upgrade pip && \
    pip2 install distorm3 yara pycrypto pillow

# Clone Volatility 2
WORKDIR /opt
RUN git clone https://github.com/volatilityfoundation/volatility.git

WORKDIR /opt/volatility

# Set default entrypoint
ENTRYPOINT ["python2", "vol.py"]fix 