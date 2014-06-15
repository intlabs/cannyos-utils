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
#curl https://raw.githubusercontent.com/intlabs/cannyos-base-archlinux/master/CannyOS/CannyOS.splash
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

if [ "$1" = 'ubuntu' ]; then
	adduser --disabled-password --gecos "" user
	echo 'user:acoman' |chpasswd
	exit
elif [ "$1" = 'arch' ]; then
	useradd -m -s /bin/bash user
	echo 'user:acoman' | chpasswd
	exit
elif [ "$1" = 'fedora' ]; then
	adduser -c "" user
	echo 'user:acoman' |chpasswd
	exit
else
	printf "You need to specify a distro!"
	wait 30
	exit
fi
