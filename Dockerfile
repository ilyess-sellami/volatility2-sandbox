FROM python:2.7-slim

# Use archived Debian repositories
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    libdistorm3-dev \
    yara \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --upgrade pip && \
    pip install distorm3 yara pycrypto pillow

# Clone Volatility 2
RUN git clone https://github.com/volatilityfoundation/volatility.git /opt/volatility

WORKDIR /opt/volatility
ENTRYPOINT ["python", "vol.py"]