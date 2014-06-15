#!/bin/sh
#
# CannyOS Ubuntu 14.04 lts base containers build script
#
# https://github.com/intlabs/cannyos-base-archlinux
#
# Copyright 2014 Pete Birley
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
curl https://raw.githubusercontent.com/intlabs/cannyos-base-archlinux/master/CannyOS/CannyOS.splash
#     *****************************************************
#     *                                                   *
#     *        _____                    ____  ____        *
#     *       / ___/__ ____  ___  __ __/ __ \/ __/        *
#     *      / /__/ _ `/ _ \/ _ \/ // / /_/ /\ \          *
#     *      \___/\_,_/_//_/_//_/\_, /\____/___/          *
#     *                         /___/                     *
#     *                                                   *
#     *                                                   *
#     *****************************************************
echo "*                                                   *"
echo "*         ADDING USER TO CONTAINER                  *"
echo "*                                                   *"
echo "*****************************************************"
echo ""


# Create a user account
if [ "$DISTRO" = 'ubuntu' ]; then
	adduser --disabled-password --gecos "" user
elif [ "$DISTRO" = 'archlinux' ]; then
	useradd -m -s /bin/bash user
elif [ "$DISTRO" = 'fedora' ]; then
	adduser -c "" user
elif [ "$DISTRO" = 'opensuse' ]; then
	useradd -c "" user
else
	printf "You need to specify a distro! - Adding user failed"
	exit
fi

# Set up user security
echo 'user:acoman' |chpasswd