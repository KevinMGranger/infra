function rsmv -d "Move using rsync" -w rsync
    rsync -r --info=progress2 --remove-source-files $argv;
end
