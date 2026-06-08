# make

[GNU make](https://www.gnu.org/software/make/) as a single self-contained binary, built natively for Linux, macOS, and Windows.

[![CI](https://github.com/unpins/make/actions/workflows/make.yml/badge.svg)](https://github.com/unpins/make/actions)
![Linux](https://img.shields.io/badge/Linux-✓-success?logo=linux&logoColor=white)
![macOS](https://img.shields.io/badge/macOS-✓-success?logo=apple&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-✓-success?logo=windows&logoColor=white)

Part of the [unpins](https://unpins.org) catalog; install it with [`unpin`](https://github.com/unpins/unpin): `unpin install make`.

## Usage

Run the `make` program with [unpin](https://github.com/unpins/unpin):

```bash
unpin make -C path target
```

To install it onto your PATH:

```bash
unpin install make
```

## Man pages

`make.1` is embedded in the binary — read with `unpin man make`.

## Build locally

```bash
nix build github:unpins/make
./result/bin/make
```

Or run directly:

```bash
nix run github:unpins/make
```

The first invocation will offer to add the [unpins.cachix.org](https://unpins.cachix.org) substituter so most pulls come pre-built.

## Manual download

The [Releases](https://github.com/unpins/make/releases) page has standalone binaries for manual download.
