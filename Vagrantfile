VAGRANT_IMAGE_NAME = "ashleykleynhans/jammy64"

RABBITMQ_NODES = 3
LOAD_BALANCER_NODES = 2

RABBITMQ_IP_START = 20
LB_IP_START = 30

Vagrant.configure("2") do |config|
    config.vm.box = VAGRANT_IMAGE_NAME
    config.vm.box_check_update = false
    config.ssh.insert_key = false

    # Provision Load Balancers to make the RabbitMQ cluster Highly Available
    (1..LOAD_BALANCER_NODES).each do |server_id|
        config.vm.define "rabbitmq-lb-#{server_id}" do |lb|
            lb.vm.provider "virtualbox" do |vb|
                vb.name = "rabbitmq-lb-#{server_id}"
                vb.memory = 512
                vb.cpus = 1
            end
            lb.vm.hostname = "rabbitmq-lb-#{server_id}"
            lb.vm.network :private_network, ip: PRIVATE_IP_NW + "#{LB_IP_START + server_id}"
            lb.vm.provision "ansible" do |ansible|
                ansible.compatibility_mode = "2.0"
                ansible.playbook = "ansible/playbooks/provision_lb.yml"
                ansible.extra_vars = {
                    node_ip: PRIVATE_IP_NW + "#{LB_IP_START + server_id}",
                }
            end
        end
    end

    # Provision RabbitMQ Nodes
    (1..RABBITMQ_NODES).each do |server_id|
        config.vm.define "rabbitmq-#{server_id}" do |node|
            node.vm.provider "virtualbox" do |vb|
                vb.name = "rabbitmq-#{server_id}"
                vb.memory = 1024
                vb.cpus = 1
            end
            node.vm.hostname = "rabbitmq-#{server_id}"
            node.vm.network :private_network, ip: PRIVATE_IP_NW + "#{RABBITMQ_IP_START + server_id}"
            node.vm.provision "ansible" do |ansible|
                ansible.compatibility_mode = "2.0"
                if server_id == 1
                    ansible.playbook = "ansible/playbooks/provision_rabbitmq_primary.yml"
                else
                    ansible.playbook = "ansible/playbooks/provision_rabbitmq_secondary.yml"
                end
                ansible.extra_vars = {
                    node_ip: PRIVATE_IP_NW + "#{RABBITMQ_IP_START + server_id}",
                }
            end

            # Only run this playbook on the primary node once all nodes are up and
            # fully provisioned
            if server_id == RABBITMQ_NODES
                node.vm.provision "ansible" do |ansible|
                    ansible.limit = "rabbitmq-1"
                    ansible.compatibility_mode = "2.0"
                    ansible.playbook = "ansible/playbooks/configure_rabbitmq_cluster.yml"
                end
            end
        end
    end
end
