# FROM rust:1.50 as planner
# WORKDIR /app
# RUN cargo install cargo-chef 
# COPY . .
# RUN cargo chef prepare  --recipe-path recipe.json

# FROM rust:1.45 as cacher
# WORKDIR /app
# RUN cargo install cargo-chef
# COPY --from=planner /app/recipe.json recipe.json
# RUN cargo chef cook --release --recipe-path recipe.json

# FROM rust:1.45 as builder
# WORKDIR /app
# COPY . .
# COPY --from=cacher /app/target target
# RUN cargo build --release

# FROM rust:1.45 as runtime
# LABEL authors="Haoyu Lin and Runchao Han"
# WORKDIR /app
# COPY --from=builder /app/target/release/randchaind /bin/randchaind
# COPY --from=builder /app/tools/ /randchain-tools/


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

