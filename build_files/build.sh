#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Terra repo (provides mangowm)
dnf5 install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# Everything from Fedora's repos and Terra
dnf5 install -y  firefox foot mangowm noctalia 
dnf5 install -y gvfs-mtp gvfs-afc gvfs-fuse
dnf5 install -y fastfetch fish fzf helix fzf helix ripgrep tmux zoxide

# yazi from COPR
dnf5 -y copr enable lihaohong/yazi
dnf5 install -y yazi
dnf5 -y copr disable lihaohong/yazi

dnf5 clean all

systemctl enable podman.socket
