Docker - Base image
===================
A base image using [su-exec][su-exec], based on a custom [Alpine Linux][alpine]

##### Health status
[![Build Status][build-status]][repository]
[![Github - Last tag][last-tag]][tags]

Usage
-----
### Create an image
* Create a `Dockerfile`
```
FROM eviweb/base-image

CMD ["/my/command/to/run"]
```
* Build the image
`docker build -t vendor/image:version .`

### Change entrypoint in Dockerfile
Use the `entrypoint` provided command:    

```
FROM eviweb/base-image

ENTRYPOINT ["entrypoint", "/my/command/to/run"]
```

### Add packages in Dockerfile
Use the `add-pack` provided command:    

```
FROM eviweb/base-image

RUN add-pack package package@repository

CMD ["/my/command/to/run"]
```

### Run as different user
The user name and the user uid customized, by using respective environment variables `LOCAL_USER_NAME` and `LOCAL_USER_UID` when calling `docker run`.    

ie. `docker run --rm -e LOCAL_USER_NAME=myuser -e LOCAL_USER_UID=2200 vendor/image:version`   

The user is created within the container if he didn't already exist.    
This allow to run the container as `root` if needed.

### Be more verbose
You can display the current user and his uid, by using the `DEBUG=1` environment variable when calling `docker run`.    

ie. `docker run --rm -e DEBUG=1 vendor/image:version`   

Alpine Package Repositories
---------------------------
The following pacakge repositories are currently provided by this image:
* Edge Main: tagged `@main`
* Edge Community: tagged `@community`
* Edge Testing: tagged `@testing`

To install a package from one of these repositories, simply tag the package as `pakage@repository`.

ie. `php7@community`

> Please note that untagged packages refer to the `@main` repository.

Alpine Installed Packages
-------------------------
Please refer to [Alpine Packages][alpine-packages]

Build
-----
To build this image, run `make` from the root of this project.

Credits
-------
* [iMega Base Builder][imega-docker]
* [Handling Permissions with Docker Volumes][denibertovic]: thanks to [Deni BERTOVI&#262;][denibertovic-github]

License
-------
This project is licensed under the terms of the [MIT License][license]

[alpine]: https://alpinelinux.org/
[alpine-packages]: https://github.com/eviweb/base-image/blob/master/alpine-packages.md
[build-status]: https://travis-ci.org/eviweb/base-image.svg?branch=master
[denibertovic]: https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
[denibertovic-github]: https://github.com/denibertovic
[imega-docker]: https://github.com/imega-docker/base-builder
[last-tag]: https://img.shields.io/github/tag/eviweb/base-image.svg
[license]: https://github.com/eviweb/base-image/blob/master/LICENSE
[repository]: https://travis-ci.org/eviweb/base-image
[su-exec]: https://github.com/ncopa/su-exec
[tags]: https://github.com/eviweb/base-image/tags