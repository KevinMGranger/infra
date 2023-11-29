if not set -l git (__fish_git_prompt_show_informative_status=true fish_git_prompt)
    set -l git "no git repo"
end

set -a prompt_parts "⎇️" "$git"