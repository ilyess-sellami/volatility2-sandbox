<p align="center">
  <img src="docs/vol2-sandbox-logo.png" alt="Volatility 2 Sandbox Logo" width="350"/>
</p>

<p align="center">
  <strong>
    A lightweight, portable, and reproducible Docker sandbox for 
    <a href="https://github.com/volatilityfoundation/volatility">Volatility 2</a>, 
    designed for memory forensics, DFIR investigations, and hands-on practice labs.
  </strong>
</p>

## Requirements

- [Docker](https://www.docker.com) installed on your system.

## Installation & Setup

### 1. Clone the repository

```bash
git clone https://github.com/ilyess-sellami/volatility2-sandbox.git 

cd volatility2-sandbox
```

### 2. Build the Docker image

```bash
docker build -t volatility2-sandbox .
```

### 3. Run Volatility

```bash
chmod +x vol2.sh

./vol2.sh <memorydump_full_path> <plugin> [additional options]

# Example: ./vol2.sh ~/Downloads/memdump.raw pslist --profile=Win7SP1x64
```
