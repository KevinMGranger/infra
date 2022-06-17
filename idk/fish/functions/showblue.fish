function showpr -d "show blue ocean for a build" -a build_name
	set -l url_with_slash (oc -n cartel-ci-cd get build $build_name -o jsonpath="{.metadata.annotations['openshift\.io/jenkins-blueocean-log-url']}")
	set -l url (echo $url_with_slash | string trim -l -c /)
	echo "opening $url"
	open $url
end