datacenter = "vagrant-dc"
data_dir = "/opt/consul"
client_addr = "0.0.0.0"
server = false
bind_addr = "0.0.0.0" # Listen on all IPv4
advertise_addr = "{{ GetInterfaceIP `eth1` }}"
retry_join = ["10.10.10.41", "10.10.10.42", "10.10.10.43"]
enable_local_script_checks = true