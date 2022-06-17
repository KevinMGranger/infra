function dotenv --description 'Load environment variables from .env file'
    set -l envfile ".env"
    if [ (count $argv) -gt 0 ]
        set envfile $argv[1]
    end

    if test -r $envfile
        while read -l line
            set -l kv (string split -m 1 = -- $line)
            set -gx $kv
        end < "$envfile"
    end
end