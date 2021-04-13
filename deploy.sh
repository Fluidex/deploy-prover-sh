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
source $HOME/.cargo/env

echo '
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
replace-with = "tuna"
[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"
' >> $HOME/.cargo/config

# cat $HOME/.cargo/config

cargo install --git https://github.com/Fluidex/plonkit

# TODO: install snarkit

mkdir -p $HOME/repos
git clone git@github.com:Fluidex/circuits.git $HOME/repos/Fluidex/circuits
git clone git@github.com:Fluidex/prover-cluster.git $HOME/repos/Fluidex/prover-cluster
