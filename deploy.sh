#!/bin/bash

apt-get update
apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    ssh \
    libssl-dev \
    apt-utils \
    pkg-config \
    nasm \
    nlohmann-json3-dev
apt-get clean
rm -rf /var/lib/apt/lists/*
apt-get update

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo 'source $HOME/.cargo/env' >> $HOME/.bashrc
