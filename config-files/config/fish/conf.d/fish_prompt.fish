function fish_prompt --description 'Write out the prompt'
    set stat $pipestatus

    if fish_is_root_user
        source ../_manual_source/root_prompt.fish
        return
    end

    set -e prompt_parts

    for file in (status dirname)/_manual_source/prompt_parts.d/*.fish
        source $file
    end

    echo (string join ' ' $prompt_parts)
    printf "> "
end