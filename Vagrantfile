# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"

  config.vm.provision :dependencies, type: :shell, inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    echo "deb http://httpredir.debian.org/debian stretch-backports main non-free" \
        > /etc/apt/sources.list.d/backports.list

    apt-get update
    apt-get -t stretch-backports install -y debootstrap
    apt-get install -y golang git libglib2.0-dev libostree-dev qemu-system-x86 \
        qemu-user-static systemd-container

    export GOPATH=/opt/src/gocode
    go get -u github.com/go-debos/debos/cmd/debos
  SHELL

  config.vm.provision :build_example, type: :shell, inline: <<-SHELL
    export GOPATH=/opt/src/gocode
    export GOBIN="${GOPATH}/bin"
    export PATH="$(go env GOBIN):$PATH"

    debos /vagrant/example.yaml
  SHELL
end
