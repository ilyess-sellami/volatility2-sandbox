FROM python:2.7-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/lib

# Use archived Debian repositories (for old Python 2 packages)
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Install required system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    libdistorm3-dev \
    yara \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages required by Volatility 2
RUN pip install --upgrade pip && \
    pip install distorm3 yara pycrypto pillow

# Fix shared library cache so libyara.so is found
RUN ldconfig

# Clone Volatility 2 repository
RUN git clone https://github.com/volatilityfoundation/volatility.git /opt/volatility

# Set working directory
WORKDIR /opt/volatility

# Default entrypoint
ENTRYPOINT ["python", "vol.py"]