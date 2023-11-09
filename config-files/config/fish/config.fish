set -x EDITOR nvim

fish_add_path ~/.local/bin ~/.cargo/bin ~/go/bin 

set PLAN9 ~/code/plan9port

fish_add_path --path --append "$PLAN9/bin"

# no greeting
set -U fish_greeting