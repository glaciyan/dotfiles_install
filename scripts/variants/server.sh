#!/bin/sh
echo "slimetsp server setup, run as root"

apt-get update

# Own deps
apt-get install -y git postgresql-13
apt-get upgrade -y