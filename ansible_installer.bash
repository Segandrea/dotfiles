#!/usr/bin/env bash

sudo dnf install -y ansible

ansible-galaxy collection install community.general

sudo ansible-pull -U https://github.com/Segandrea/dotfiles
