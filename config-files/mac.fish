eval (/opt/homebrew/bin/brew shellenv)

alias bup "brew upgrade"

for python in /opt/homebrew/opt/python@3.*
    fish_add_path $python/bin
end

fish_add_path ~/Library/Python/3.10/bin # pip install --user

alias tailscale /Applications/Tailscale.app/Contents/MacOS/Tailscale