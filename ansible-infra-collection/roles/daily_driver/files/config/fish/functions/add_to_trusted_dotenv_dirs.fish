function add_to_trusted_dotenv_dirs --description "Add the current path or given paths to the list of trusted dotenv dirs"
    if test (count $argv) -eq 0;
        set --universal --path --append trusted_dotenv_dirs $PWD
    else
        set --universal --path --append trusted_dotenv_dirs $argv
    end
end