function c -d "Display directory or file contents" -a target
    if test -z $target
        or test -d $target
        ls $target $argv[2..]
    else
        cat $target $argv[2..]
    end
end
