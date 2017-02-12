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
FROM alpine:3.4
MAINTAINER Emory Merryman <emory.merryman@gmail.com>
COPY run.sh exec.xslt.xml exec.data.xml sudo.txt bin.txt /opt/docker/
RUN ["/bin/sh", "/opt/docker/run.sh"]
ENTRYPOINT ["/bin/sh", "/opt/docker/entrypoint.sh"]
CMD []