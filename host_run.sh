#!/bin/sh

qemu-system-x86_64 \
    -m 2048 \
    -enable-kvm \
    -drive if=pflash,format=raw,readonly,file=/usr/share/ovmf/OVMF.fd \
    -drive if=virtio,format=raw,cache=unsafe,file=buster-amd64.img
