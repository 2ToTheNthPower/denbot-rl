#!/bin/bash

echo "🚀 Starting DenBot-RL installation..."

# Check if rustup is installed
if ! command -v rustup &> /dev/null; then
    echo "Installing Rust via rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env"
else
    echo "✓ Rust is already installed"
fi

# Check if uv is installed
if ! command -v uv &> /dev/null; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
else
    echo "✓ uv is already installed"
fi

# Initialize and update git submodules
echo "Initializing git submodules..."
git submodule update --init --recursive

# Build RLViser
echo "Building RLViser..."
cd rlviser_code
cargo build
if [ $? -ne 0 ]; then
    echo "❌ Failed to build RLViser"
    exit 1
fi

# Copy binary and make executable
echo "Installing RLViser binary..."
cp target/debug/rlviser ..
cd ..
chmod +x rlviser

# Initialize Python environment
echo "Setting up Python environment..."
uv sync

echo "✨ Installation complete! You can now:"
echo "  1. Start training: uv run train.py exp=offense"
echo "  2. Watch agent (after checkpoint generation): uv run load_latest.py"