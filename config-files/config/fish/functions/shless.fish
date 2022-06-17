function shless --description "Execute the given command with the 'help' subcommand and pipe it to `less`"
    $argv[1] help $argv[2..] | less
end
