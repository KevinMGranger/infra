function c -d "Display directory or file contents" -a target
    if test -z $target
        or test -d $target
        exa $target $argv
    else
        bat $target $argv
    end
end
