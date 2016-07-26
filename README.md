# nrf52-base

STATUS: preliminary support, builds for the nRF52 family and S132 SoftDevice.  

[![Build Status](https://travis-ci.org/ryankurte/nrf52-base.svg)](https://travis-ci.org/ryankurte/nrf52-base)

## Getting Started

### Quick Start

1. Run `./bootstrap.sh` to download the nRF52 SDK and pull the libraries into this project
2. Run `mkdir build` to create a build directory
3. In the build directory, run `cmake ..` to initialize cmake
4. In the build directory, run `make` to build the example project

## TODO
 - [ ] support for new softdevices
 - [ ] better getting started guide
 - [ ] integrate nrfjprog to simplify programming etc

------

This project is MIT licensed to avoid placing limitations on possible uses. Note that Nordic components fetched as part of the `./bootstrap.sh` script are covered under Nordic license terms in `lib\documentation/license.txt` after bootstrapping.  

If you make improvements, please consider opening a pull request and contributing them back. 
And if you use this in a project, I would love to hear about it (and you can find my email in any of my git commits).  

If you have any questions, comments, or suggestions, feel free to open an issue or a pull request.
