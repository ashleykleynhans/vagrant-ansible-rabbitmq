# vagrant-ansible-rabbitmq

Provision a RabbitMQ cluster on Ubuntu 22.04 LTS using Vagrant, Virtualbox and Ansible.

## Clone the GitHub Repository

Run the following command from the terminal to clone the GitHub Repository:

```bash
git clone https://github.com/ashleykleynhans/vagrant-ansible-rabbitmq.git
```

## Install Required Software

Begin by installing the homebrew package manager, which works on both Mac
 and Ubuntu Linux.  May work on other Linux distributions but has not bee
n tested.

Run the following command from the terminal to install homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

All of the remaining software can be installed by cloning the git repository and  running the setup script provided.

Run the setup script from the terminal to install the required software:

```bassh
./setup.sh
```

## Managing the Stack

Begin by ensuring that you are in the directory which the Github Repository was cloned to:

```
cd vagrant-ansible-rabbitmq
```

### Starting the Stack

```bash
vagrant up
```

### Stopping the Stack

```bash
vagrant halt
```

### Deleting the Stack

```bash
vagrant destroy -f
```
