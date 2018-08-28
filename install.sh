#!/bin/bash

TARGET=/usr/os-workshop-gcc
TARBALL=os-workshop-gcc-ubuntu.tar.gz

if [ "$1" == "" ] || [ "$1" == "install" ] ;then
    read -p "About to copy to ${TARGET}, continue? [y/N]: " answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        wget https://github.com/jsren/os-workshop-gcc/releases/download/v0.1/${TARBALL}
        tar -xhzf ${TARBALL}
        sudo mv os-workshop-gcc ${TARGET}
        sudo chmod a+rwx ${TARGET}
        rm -f ${TARBALL}
    else
        echo exiting without changes
    fi
else
    if [ "$1" == "uninstall" ] ;then
        read -p "About to delete ${TARGET}, continue? [y/N]: " answer
        if [ "$answer" != "${answer#[Yy]}" ] ;then
            sudo rm -rf ${TARGET}
        else
            echo exiting without changes
        fi
    else
        echo unknown command: "$1"
    fi
fi
