install-role role_path:
    mkdir -p ~/.ansible/roles
    ln -fs {{ absolute_path(join(invocation_directory(), role_path)) }} \
        ~/.ansible/roles/{{ file_name(role_path) }}

# install-collection name collection_path:
#     mkdir -p ~/.ansible/collections/ansible_collections/{{ replace(name, '.', '/') }}
#     ln -fs {{ absolute_path(join(invocation_directory(), collection_path)) }} \
#         ~/.ansible/collections/ansible_collections/{{ replace(name, '.', '/') }}

galaxy-install path:
    ansible-galaxy collection install --force \
        {{ quote(absolute_path(join(invocation_directory(), path))) }}

json2yaml src flags='':
    @yq -p=yaml -o=yaml -P ea '.' {{ flags }} {{ quote(src) }}