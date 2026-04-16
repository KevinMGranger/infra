#!/usr/bin/python3

from collections.abc import Iterable, Sequence
import json
import os
from pprint import pprint
import subprocess
from typing import Any

from ansible.module_utils.basic import AnsibleModule

# TODO: Popen so things can run in the background


def run_cmd_lines(args: Sequence[str]) -> Sequence[str]:
    result = subprocess.run(
        args, stdin=subprocess.DEVNULL, capture_output=True, text=True, check=True
    )
    # TODO: handle stderr
    return result.stdout.splitlines()


def list_installed() -> Sequence[str]:
    # if you _ever_ do variables, split this list manually
    return run_cmd_lines("brew list --full-name --installed-on-request -1".split())


def list_leaves() -> Sequence[str]:
    # if you _ever_ do variables, split this list manually
    return run_cmd_lines("brew leaves --installed-on-request".split())


def get_aliases_for(packages: Sequence[str]) -> dict[str, str]:
    json_output = subprocess.run(
        [*"brew info --json".split(), *packages],
        stdin=subprocess.DEVNULL,
        capture_output=True,
        check=True,
    ).stdout
    # TODO: handle stderr
    parsed = json.loads(json_output)
    ret = dict()
    for info in parsed:
        name = info["name"]
        aliases = info["aliases"]
        ret[name] = name
        for alias in aliases:
            ret[alias] = name
    return ret

# ugh what's the right way to structure this

def get_packages_info() -> dict[str, dict[str, Any]]:
    leaves = set(list_leaves())
    installed = list_installed()
    alias_map = get_aliases_for(installed)
    return {name: dict(name=name, leaf=name in leaves) for name in installed}


def ansible_main():
    # TODO: norm for check mode when it's inherently info-gathering?
    module = AnsibleModule(argument_spec={}, supports_check_mode=True)
    module.exit_json(changed=False, packages=get_packages_info())


def cli_main():
    packages = get_packages_info()
    pprint(packages)


if __name__ == "__main__":
    if os.environ.get("NOT_ANSIBLE"):
        cli_main()
    else:
        ansible_main()
