# nrf52-base

STATUS: builds for the nRF52 family

[![Build Status](https://travis-ci.org/ryankurte/nrf52-base.svg)](https://travis-ci.org/ryankurte/nrf52-base)

## TODO

[ ] Sort out linker scripts (not yet using correct one[s], what is the correct one?)
[ ] Set flash start based on softdevice selection
[ ] Allow linking without a softdevice

## Getting Started

1. Run `./bootstrap.sh` to download the nRF52 SDK and pull the libraries into this project
2. Run `mkdir build` to create a build directory
3. In the build directory, run `cmake ..` to initialize cmake
4. In the build directory, run `make` to build the example project
