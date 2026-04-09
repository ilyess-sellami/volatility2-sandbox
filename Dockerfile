FROM python:2.7-buster

ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH=/usr/local/lib

# Use archived Debian repositories
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    automake \
    libtool \
    pkg-config \
    libssl-dev \
    python-dev \
    libdistorm3-dev \
    curl \
    ca-certificates \
    m4 \
    libjansson-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --upgrade pip && pip install distorm3 pycrypto pillow

# Build Yara 3.8.1 from source
RUN git clone https://github.com/VirusTotal/yara.git /tmp/yara && \
    cd /tmp/yara && \
    git checkout tags/v3.8.1 && \
    ./bootstrap.sh && \
    ./configure --enable-cuckoo --enable-magic && \
    make && make install && make clean && \
    ldconfig && \
    rm -rf /tmp/yara

# Clone Volatility 2
RUN git clone https://github.com/volatilityfoundation/volatility.git /opt/volatility

WORKDIR /opt/volatility
ENTRYPOINT ["python", "vol.py"]