#!/usr/bin/env bash
sudo dnf install ansible -y

# TODO: need to cd here

ansible-galaxy collection install --force ./ansible-infra-collection

ansible-playbook kmg.infra.daily_driver -i ./inventories/local.ini -e vscode_fish=true

# TODO: probably make this part of ansible?

mkdir -p ~/.bashrc.d
echo "if which fish; then exec fish; else echo 'no fish'; fi" > ~/.bashrc.d/fishy
