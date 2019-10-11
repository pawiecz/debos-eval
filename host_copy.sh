#!/bin/sh

vagrant ssh-config > config.txt

scp -F config.txt default:/home/vagrant/buster-amd64.img.gz .

rm config.txt
