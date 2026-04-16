#!/usr/bin/env python

from collections.abc import Iterable, Sequence
import subprocess
from typing import Any
from pprint import pprint

from ansible.module_utils.basic import AnsibleModule


def run_cmd_lines(args: Sequence[str]) -> Iterable[str]:
    result = subprocess.run(
        args, stdin=subprocess.DEVNULL, capture_output=True, text=True, check=True
    )
    # TODO: handle stderr
    return result.stdout.splitlines()


def list_installed() -> Iterable[str]:
    # if you _ever_ do variables, split this list manually
    return run_cmd_lines("brew list --full-name --installed-on-request -1".split())


def list_leaves() -> Iterable[str]:
    # if you _ever_ do variables, split this list manually
    return run_cmd_lines("brew leaves --installed-on-request".split())


def get_packages_info() -> dict[str, dict[str, Any]]:
    leaves = set(list_leaves())
    installed = list_installed()
    return {name: dict(leaf=name in leaves) for name in installed}


def main():
    pprint(get_packages_info())

if __name__ == "__main__":
    main()