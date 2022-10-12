function fish_prompt --description 'Write out the prompt'
    set stat $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

    switch "$USER"

        case root toor

            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end

            printf '%s@%s %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

        case '*'

            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end

            if which current-kube-context > /dev/null 2>&1
                set kube_ctx (current-kube-context 2>/dev/null); or set kube_ctx "unknown context"
            else
                set kube_ctx "current-kube-context not installed"
            end

            if which fishdotenv > /dev/null 2>&1
                fishdotenv -c > /dev/null 2>&1
                switch $status
                    case 0 # in sync
                        set dotenv_status "✔️"
                    case 3 # file missing
                        set dotenv_status "?"
                    case 4 # out of sync
                        set dotenv_status (echo (set_color --bold red) "OUT OF SYNC" (set_color normal))
                    case '*' # some other error
                        set dotenv_status (echo (set_color red) "e$status" (set_color normal))
                end
            else
                set dotenv_status "fishdotenv not installed"
            end

            set git (fish_git_prompt)
            if test $status -ne 0; set git "no git repo"; end

            printf '[%s] %s%s@%s %s%s %s(%s)%s ⎇ %s ☸️ %s 🇪 %s\f\r> ' (date "+%H:%M:%S") "$__fish_color_blue" $USER (prompt_hostname) "$__fish_prompt_cwd" "$PWD" "$__fish_color_status" "$stat" "$__fish_prompt_normal" $git $kube_ctx $dotenv_status

    end
end
