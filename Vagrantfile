VAGRANT_IMAGE_NAME = "ashleykleynhans/jammy64"

RABBITMQ_NODES = 2

RABBITMQ_IP_START = 20
LB_IP_START = 30

PRIVATE_IP_NW = "10.10.10."

Vagrant.configure("2") do |config|
    config.vm.box = VAGRANT_IMAGE_NAME
    config.vm.box_check_update = false
    config.ssh.insert_key = false

    # Provision Load Balancer to make the RabbitMQ cluster Highly Available
    config.vm.define "rabbitmq-lb" do |lb|
        lb.vm.provider "virtualbox" do |vb|
            vb.name = "rabbitmq-lb"
            vb.memory = 512
            vb.cpus = 1
        end
        lb.vm.hostname = "rabbitmq-lb"
        lb.vm.network :private_network, ip: PRIVATE_IP_NW + "#{LB_IP_START}"
        lb.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbooks/provision_lb.yml"
            ansible.extra_vars = {
                node_ip: PRIVATE_IP_NW + "#{LB_IP_START}",
            }
        end
    end

    # Provision RabbitMQ Nodes
    (1..RABBITMQ_NODES).each do |i|
        config.vm.define "rabbitmq-#{i}" do |node|
            # Name shown in the GUI
            node.vm.provider "virtualbox" do |vb|
                vb.name = "rabbitmq-#{i}"
                vb.memory = 2048
                vb.cpus = 2
            end
            node.vm.hostname = "rabbitmq-#{i}"
            node.vm.network :private_network, ip: PRIVATE_IP_NW + "#{RABBITMQ_IP_START + i}"
            node.vm.provision "ansible" do |ansible|
                if i == 1
                    ansible.playbook = "ansible/playbooks/provision_rabbitmq_primary.yml"
                else
                    ansible.playbook = "ansible/playbooks/provision_rabbitmq_secondary.yml"
                end
                ansible.extra_vars = {
                    node_ip: PRIVATE_IP_NW + "#{RABBITMQ_IP_START + i}",
                }
            end
        end
    end
end
