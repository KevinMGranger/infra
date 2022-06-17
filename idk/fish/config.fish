set -x PLAN9 ~/code/plan9port
set -x PATH $PATH $PLAN9/bin
# TODO: above should be fish_add_path
set -x NVM_DIR ~/.nvm

abbr -a firefox /Applications/Firefox.app/Contents/MacOS/firefox-bin

#set -x VISUAL code --new-window --wait

# set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)

fish_add_path /usr/local/opt/ruby/bin
fish_add_path /usr/local/opt/ruby@3.0/bin
fish_add_path /usr/local/opt/ruby@2.7/bin

fish_add_path (yarn global bin)

fish_add_path "/usr/local/opt/python@3.10/bin"
