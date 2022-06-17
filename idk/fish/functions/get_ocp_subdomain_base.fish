function get_ocp_subdomain_base
	oc whoami --show-server | cut -d'.' -f 2,3,4,5,6 | cut -d':' -f 1
end
