function c -d "Display directory or file contents" -a target
    if test -z $target
        or test -d $target
        eza $target $argv[2..]
    else
        bat $target $argv[2..]
    end
end
