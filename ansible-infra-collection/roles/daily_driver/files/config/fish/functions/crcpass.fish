function crcpass -d "get the kubeadmin password from CRC running on the given machine, or the current machine if unspecified"
    if count $argv
        ssh $argv 'cat .crc/machines/crc/kubeadmin-password'
    else
        cat .crc/machines/crc/kubeadmin-password
    end
end
