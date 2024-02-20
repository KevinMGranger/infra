install-role role_path:
    mkdir -p ~/.ansible/roles
    ln -fs {{ absolute_path(join(invocation_directory(), role_path)) }} \
        ~/.ansible/roles/{{ file_name(role_path) }}

# install-collection name collection_path:
#     mkdir -p ~/.ansible/collections/ansible_collections/{{ replace(name, '.', '/') }}
#     ln -fs {{ absolute_path(join(invocation_directory(), collection_path)) }} \
#         ~/.ansible/collections/ansible_collections/{{ replace(name, '.', '/') }}

install-collection path:
    #!/usr/bin/env python
    import yaml
    from pathlib import Path

    path = Path({{ quote(join(invocation_directory(), path)) }})
    galaxy_file = path / "galaxy.yml"
    with galaxy_file.open() as f:
        data = yaml.safe_load(f)
    ns = data['namespace']
    name = data['name']

    collections_dir = Path.home() / ".ansible/collections/ansible_collections"

    ns_path = collections_dir / ns
    ns_path.mkdir(exist_ok=True, parents=True)

    symlink_path = ns_path / name

    # TODO: is this how it works on windows anyway?
    symlink_path.symlink_to(path, target_is_directory=True)


# galaxy-install path:
#     ansible-galaxy collection install --force \
#         {{ quote(absolute_path(join(invocation_directory(), path))) }}

json2yaml src flags='':
    @yq -p=yaml -o=yaml -P ea '.' {{ flags }} {{ quote(src) }}