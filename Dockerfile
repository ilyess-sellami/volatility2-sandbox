# Updated lightweight Dockerfile for Volatility 2
FROM python:2.7-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install only required system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    libdistorm3-dev \
    yara \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python packages for Volatility 2
RUN pip install --upgrade pip && \
    pip install distorm3 yara pycrypto pillow

# Clone Volatility 2 into /opt/volatility
RUN git clone https://github.com/volatilityfoundation/volatility.git /opt/volatility

# Set working directory
WORKDIR /opt/volatility

# Set default entrypoint
ENTRYPOINT ["python", "vol.py"]