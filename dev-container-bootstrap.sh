#!/usr/bin/env bash
sudo dnf install ansible

ansible -m include_role -a name="kmg.infra.daily-driver"