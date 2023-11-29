function openshift-registry-signin --wraps podman
    set OC_REGISTRY_HOST (oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}')
    podman login -u kubeadmin -p (oc whoami -t) $argv $OC_REGISTRY_HOST
end