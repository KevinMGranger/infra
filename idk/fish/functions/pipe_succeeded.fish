function pipe_succeeded -d "did the pipe status succeed?"
    set -S pipestatus
    set -f ps $pipestatus

    if test (count $argv) -ne 0
        set -f ps $argv
    end
    set -S ps

    for _st in $ps
        set -S _st
        if test $_st -ne 0
            return $_st
        end
    end

    echo "no failures"

    return 0
end
