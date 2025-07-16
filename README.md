# Setup

## Quick Install

```bash
./install.sh
```

This will automatically:
- Install Rust (if not already installed)
- Install uv (if not already installed)
- Initialize and update git submodules
- Build RLViser from source (v0.7.16)
- Set up the Python environment

## Manual Installation

### 1. Install Prerequisites

```bash
# Install Rust (https://www.rust-lang.org/tools/install)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

# Install uv (https://docs.astral.sh/uv/getting-started/installation/)
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### 2. Setup Git Submodules

```bash
git submodule update --init --recursive
cd rlviser_code
git checkout v0.7.16
cd ..
```

### 3. Build RLViser

```bash
cd rlviser_code
cargo build
cp target/debug/rlviser ..
cd ..
chmod +x rlviser
```

### 4. Initialize Python Environment

```bash
uv sync
```

# Run

## Start training

`uv run train.py exp=offense`

## Watch agent with RLViser

#### This will only work once a checkpoint has been generated

`uv run load_latest.py`
