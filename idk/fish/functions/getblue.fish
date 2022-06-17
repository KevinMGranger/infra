function getblue -d "get blue ocean URL for a given build" -a build_name
    set -l jsonpath "{.metadata.annotations['openshift\.io/jenkins-blueocean-log-url']}"
    function _try_get_url -V build_name -V jsonpath
        oc -n TODO_NAMESPACE_HERE get build $build_name \
            -o jsonpath=$jsonpath | string trim -l -c /
    end

    while true
        set url (_try_get_url)
        if test "$status" -eq 0
            and test -n "$url"
            
            break
        end
    end

    echo "opening $url"
    open $url
end
