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
echo "*         Installing Base OS Packages               *"
echo "*                                                   *"
echo "*****************************************************"
echo ""


# Install Packages for system
if [ "$DISTRO" = 'ubuntu' ]; then
	sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
	apt-get update -yqq && \
	apt-get upgrade -yqq && \
	apt-get install -yqq build-essential && \
	apt-get install -yqq software-properties-common && \
	apt-get install -yqq byobu curl git htop man unzip nano wget sed

elif [ "$DISTRO" = 'archlinux' ]; then
	sed 's/^CheckSpace/#CheckSpace/g' -i /etc/pacman.conf && \
	pacman -Syyu --noconfirm

elif [ "$DISTRO" = 'fedora' ]; then
	yum update -y && \
	yum upgrade -y && \
	yum install -y make automake gcc gcc-c++ kernel-devel && \
	yum install -y ca-certificates python3 && \
	yum install -y byobu curl git htop man unzip nano wget sed

elif [ "$DISTRO" = 'opensuse' ]; then
	zypper refresh && \
	zypper update -y && \
	zypper install -y make automake gcc gcc-c++ kernel-devel && \
	zypper install -y ca-certificates python3 && \
	zypper install -y curl git htop man unzip nano wget sed
	
else
	printf "You need to specify a distro - Installing base OS packages failed"
	exit
fi