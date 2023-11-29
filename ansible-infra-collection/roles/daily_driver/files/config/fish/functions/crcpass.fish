function crcpass -d "get the kubeadmin password from CRC running on the given machine"
    ssh $argv 'cat .crc/machines/crc/kubeadmin-password'
end
