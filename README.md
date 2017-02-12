<!--
# Copyright © (C) 2017 Emory Merryman <emory.merryman@gmail.com>
#   This file is part of exec-injector.
#
#   Exec-injector is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Exec-injector is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with exec-injector.  If not, see <http://www.gnu.org/licenses/>.
-->
# Run Injector

## Synopsis
Injects a dependency into a container via its volumes.

## Getting Started
You need [docker](https://www.docker.com/).
You need the container id of a running container.
You shoud not need anything else.


## Example Usage

Create a container.
```
CIDFILE=$(mktemp) &&
rm ${CIDFILE} &&
docker run --detach --interactive --cidfile ${CIDFILE} alpine:3.4 sh

```

Create volumes.
```
SUDO=$(docker volume create) &&
BIN=$(docker volume create) &&
SBIN=$(docker volume create) &&
```

Inject an exec dependency into the volumes.
```
docker run --interactive --tty --rm --volume /var/run/docker.sock:/var/run/docker.sock temp/exec-injector --sudo ${SUDO} --bin ${BIN} --sbin ${SBIN} --container $(cat ${CIDFILE}) --program-name hi --command echo hello ${@}
``

Run a container with the volumes
```
docker run --interactive --tty --rm --volume /var/run/docker.sock:/var/run/docker.sock:ro --volume ${SUDO}:/etc/sudoers.d:ro --volume ${BIN}:/usr/local/bin --volume ${SBIN}:/usr/local/sbin:ro emorymerryman/base:0.2.0 hi world

```

In this example, there are 2 containers.
The second container has a binary `/usr/local/bin/hello` that ultimately invokes the first container.