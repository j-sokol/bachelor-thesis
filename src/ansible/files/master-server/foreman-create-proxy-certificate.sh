#!/usr/bin/env bash

showUsage() {
  cat << EOF
  foreman-create-proxy-certificate.sh FQDN
  creates certificates for new foreman proxy and tries to send them to the proxy server.
EOF
}

sendKeys() {
  "Add this key to /root/.ssh/authorized_keys on ${HOSTNAME}:"
  cat /root/.ssh/id_rsa.pub
  read -rsp $'Press any key to continue...\n' -n1 key
ssh root@$HOSTNAME mkdir -p /etc/foreman-proxy/ssl/certs
ssh root@$HOSTNAME mkdir -p /etc/foreman-proxy/ssl/private_keys
rsync -avh /etc/puppetlabs/puppet/ssl/private_keys/${HOSTNAME}.pem root@${HOSTNAME}:/etc/foreman-proxy/ssl/private_keys/${HOSTNAME}.pem
rsync -avh /etc/puppetlabs/puppet/ssl/certs/ca.pem ${HOSTNAME}:/etc/foreman-proxy/ssl/certs/ca.pem
rsync -avh /etc/puppetlabs/puppet/ssl/certs/${HOSTNAME}.pem ${HOSTNAME}:/etc/foreman-proxy/ssl/certs/${HOSTNAME}.pem
ssh root@$HOSTNAME chown -R foreman-proxy:foreman-proxy /etc/foreman-proxy/ssl/

}


if [ $# -ne 1 ]; then
    showUsage
    echo "Bad arguments provided."
    exit 1
fi

if [ ! -f "~/.ssh/id_rsa.pub" ]; then
    echo "Could not locate your public ssh key. Please create it with command ssh-keygen first"
    exit 1

fi

#

HOSTNAME="$1"


/opt/puppetlabs/bin/puppet cert --generate $HOSTNAME

sendKeys
