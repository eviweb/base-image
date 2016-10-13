# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

### [Unreleased][unreleased]

#### Changed
- keep the build folder in the directory layout

#### Fixed
- issue #1: Travis failure: missing docker command
- `make test` can be run independently

### 0.1.0 - 2016-10-12
#### Added
- package files
- test files
- Makefile
- Dockerfile
- ./runner/entrypoint.sh (used while building rootfs)
- resources:    
    - add-pack
    - apk-repositories
    - entrypoint.sh (docker image entrypoint)

