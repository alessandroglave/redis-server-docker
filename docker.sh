#!/bin/sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
cat > /etc/apt/sources.list.d/docker.list <<EOM
deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -c -s) stable
EOM
apt-get -y update
apt-get -y install docker-ce
systemctl enable docker
systemctl start docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;

chmod +x /usr/local/bin/docker-compose;
sed -e 's|#DOCKER_OPTS|DOCKER_OPTS|g' \
    -i /etc/default/docker

sed -e 's|DEFAULT_FORWARD_POLICY=.*|DEFAULT_FORWARD_POLICY="ACCEPT"|g' \
    -i /etc/default/ufw

ufw allow 2375/tcp
ufw allow 2376/tcp
