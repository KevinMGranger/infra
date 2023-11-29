install-role role_path:
    mkdir -p ~/.ansible/roles
    ln -fs {{ absolute_path(join(invocation_directory(), role_path)) }} ~/.ansible/roles/{{ file_name(role_path) }}