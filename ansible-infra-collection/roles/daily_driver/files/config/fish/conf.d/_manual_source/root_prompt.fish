if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
end

if not set -q __fish_color_blue
    set -g __fish_color_blue (set_color -o blue)
end

if not set -q __fish_prompt_cwd
    if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
    else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end
end

printf '%s@%s %s %s%s%s# ' $USER (prompt_hostname) $emoji "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"
