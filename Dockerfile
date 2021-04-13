FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        git \
        ssh \
        libssl-dev \
        pkg-config && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Update new packages
RUN apt-get update

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

# ENV RUSTUP_HOME=/rust
# ENV CARGO_HOME=/cargo
# ENV PATH=/cargo/bin:/rust/bin:$PATH
ENV PATH="/root/.cargo/bin:${PATH}"
