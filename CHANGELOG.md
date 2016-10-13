# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

### [Unreleased][unreleased]

#### Added
- `bin/listpkg` to generate automatically the list of Alpine installed packages

#### Changed
- keep the build folder in the directory layout
- generate automatically the list of Alpine installed packages during build
- replace Alpine installed packages list in readme by a link to `./alpine-packages.md`

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

