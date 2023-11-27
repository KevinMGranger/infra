install-role role_path:
    mkdir -p ~/.ansible/roles
    ln -s {{ absolute_path(role_path) }} ~/.ansible/roles/{{ file_name(role_path) }}