function c -d "Display directory or file contents, longly" -a target
    if test -z $target
        or test -d $target
        ls -l $target $argv[2..]
    else
        cat $target $argv[2..]
    end
end
