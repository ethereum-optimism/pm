#!/usr/bin/env bash

set -euo pipefail

echo "Installing mdbook..."
curl -L https://github.com/rust-lang/mdBook/releases/download/v0.4.44/mdbook-v0.4.44-x86_64-unknown-linux-gnu.tar.gz | tar xvz

echo "Installing mdbook-mermaid.."
cargo install mdbook-mermaid

echo "Building book..."
./mdbook build