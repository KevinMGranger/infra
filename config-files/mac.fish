eval (/opt/homebrew/bin/brew shellenv)

alias bup "brew upgrade"

# > Unversioned and major-versioned symlinks `python`, `python3`, `python-config`, `python3-config`, `pip`, `pip3`, etc. pointing to
# `python3.11`, `python3.11-config`, `pip3.11` etc., respectively, have been installed into
# > /opt/homebrew/opt/python@3.11/libexec/bin

# python's existence in regular homebrew bin relies on linking.
# linking "homebrew's python" will also link that to python3, even if not the latest.
# but only the latest has python3 in its libexec. weird!

# TODO: gotta revisit this after trying it all out. unclear how stuff ends up where.
# python system packages /opt/homebrew/lib/pythonVERSION/site-packages
# python user packages ~/Library/Python/VERSION/bin # pip install --user

for python in /opt/homebrew/opt/python@3.*/libexec/bin
    # looping instead of just globbing on fish_add_path
    # because otherwise it's added in the order given,
    # e.g. older versions up front.
    # because it prepends, this gives it to us in "reverse".

    fish_add_path $python
end

alias tailscale /Applications/Tailscale.app/Contents/MacOS/Tailscale