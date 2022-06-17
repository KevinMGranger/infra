# Defined in /var/folders/pz/l8ys1xyn6sz4bj5kpbt5zhnw0000gn/T//fish.zCJZLY/detest.fish @ line 1
function detest --argument path
	set members $path/*
    if test (count $members) -eq 1
        mv $members (dirname $path)
        rmdir $path
    end
end
