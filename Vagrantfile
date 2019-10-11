# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"

  config.vm.provision :dependencies, type: :shell, inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y golang git libglib2.0-dev libostree-dev qemu-system-x86 \
        qemu-user-static debootstrap systemd-container parted dosfstools

    export GOPATH=/opt/src/gocode
    go get -u github.com/go-debos/debos/cmd/debos
  SHELL

  config.vm.provision :build_image, type: :shell, inline: <<-SHELL
    export GOPATH=/opt/src/gocode
    export GOBIN="${GOPATH}/bin"
    export PATH="$(go env GOBIN):$PATH"

    debos /vagrant/image-amd64.yaml
  SHELL
end
