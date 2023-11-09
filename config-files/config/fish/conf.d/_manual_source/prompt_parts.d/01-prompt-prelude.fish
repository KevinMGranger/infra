set -l blue (set_color -o blue)
set -l green (set_color -o green)
set -l red (set_color -o red)
set -l normal (set_color normal)

set -l cwd_color (set_color $fish_color_cwd)

set -l time (date +'%G-%m-%d %H:%M:%S')
set -l host (prompt_hostname)
set -l pwd (prompt_pwd --dir-length=0)

set -l whomst "$blue$USER@$host"

set -a prompt_parts "[$time]" $whomst $emoji "$cwd_color$pwd"

set -l any_failed 0
set -l colored_pipe_parts (for s in $stat
        if test $s -ne 0
            set any_failed 1
            echo "$red$s$normal"
        else
            echo "$green$s$normal"
        end
    end)

set -l ps (string join ' | ' $colored_pipe_parts)

if test $any_failed -eq 0
    set -a prompt_parts "$green(0)$normal"
else
    set -l lparen "$red($normal"
    set -l rparen "$red)$normal"
    set -a prompt_parts "$lparen$ps$rparen"
end
