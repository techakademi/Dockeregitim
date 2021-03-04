#!/bin/sh

# Bu skript ile, Centos işletim sistemine yeni Docker, Docker-Compose ve git'in son sürümün yükleme işlemini gerçekleştirebilirsiniz.

yum -y update

yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
	
yum -y install docker-ce docker-ce-cli containerd.io

systemctl start docker

systemctl enable docker

yum -y install bash-completion

curl -L https://raw.githubusercontent.com/docker/compose/1.25.5/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

yum -y remove git*

yum -y install https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm

yum -y install git
