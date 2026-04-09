<p align="center">
  <img src="docs/logo.png" alt="Volatility 2 Sandbox Logo" width="350"/>
</p>

A lightweight, portable, and reproducible Docker sandbox for [Volatility 2](https://github.com/volatilityfoundation/volatility), designed for memory forensics, DFIR investigations, and hands-on practice labs.

## Requirements

- [Docker](https://www.docker.com) installed on your system.

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/<your-username>/volatility2-sandbox.git 

cd volatility2-sandbox
```

### 2. Build the Docker image

```bash
docker build -t volatility2-sandbox .
```

### 3. Run Volatility

```bash
./vol2.sh <memorydump_full_path> <plugin> [additional options]

# Example: ./vol2.sh ~/Downloads/memdump.raw pslist --profile=Win7SP1x64
```
