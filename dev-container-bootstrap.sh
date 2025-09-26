#!/usr/bin/env bash
sudo dnf install ansible -y

ansible-galaxy collection install ./ansible-infra-collection

ansible-playbook kmg.infra.daily_driver -i ./inventories/local.ini