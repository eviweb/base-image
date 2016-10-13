# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

### [Unreleased][unreleased]

#### Added
- `bin/listpkg` to generate automatically the list of Alpine installed packages
- `bin/delimg` to remove any docker images that should have been previously generated
- Travis CI to Docker:
    - automatically build Docker images on successful tests
    - add `bin/trigger-docker` to trigger a Docker build for the current branch or tag
    - push the `alpine` tagged image on successful tests on `master` branch
- add project health status in `README.md`

#### Changed
- keep the build folder in the directory layout
- generate automatically the list of Alpine installed packages during build
- replace Alpine installed packages list in readme by a link to `./alpine-packages.md`
- Alpine version:
    - is set in its own file
    - is used to generate the `apk-repositories` file
- the build target now tags the docker image with `latest` and  the alpine version
- the clean target now remove any existing docker image
- keep `./build/rootfs.tar.gz` in the repository to allow Docker Hub automatic build

#### Fixed
- issue #1: Travis failure: missing docker command
- `make test` can be run independently
- fix links to `alpine-packages.md` and `LICENSE` that they are accessible from Docker Hub

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

