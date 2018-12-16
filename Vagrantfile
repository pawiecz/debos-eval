# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"

  config.vm.provision :dependencies, type: :shell, inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y golang git libglib2.0-dev libostree-dev qemu-system-x86 \
        qemu-user-static debootstrap systemd-container

    export GOPATH=/opt/src/gocode
    go get -u github.com/go-debos/debos/cmd/debos
  SHELL
end
