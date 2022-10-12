function crlogin -d "log in to the local CRC cluster as kubeadmin" -w oc
    oc login -u kubeadmin -p (cat ~/.crc/machines/crc/kubeadmin-password) https://api.crc.testing:6443 $argv
end