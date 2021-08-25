#!/bin/sh
echo "slimetsp docker install script for servers"
# Docker
apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io