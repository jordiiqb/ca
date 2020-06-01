#! /bin/bash
# Install ldapserver

rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/ldap/*

cp /opt/docker/ca.conf /etc/openldap/certs/.
cp /opt/docker/ca.crt /etc/openldap/certs/.
cp /opt/docker/ca.key /etc/openldap/certs/.
cp /opt/docker/ca.srl /etc/openldap/certs/.
cp /opt/docker/server.crt /etc/openldap/certs/.
cp /opt/docker/server.csr /etc/openldap/certs/.
cp /opt/docker/server.key /etc/openldap/certs/.

cp /opt/docker/DB_CONFIG /var/lib/ldap
slaptest -f /opt/docker/slapd.conf -F /etc/openldap/slapd.d/
slapadd -F /etc/openldap/slapd.d/ -l /opt/docker/edt.org.ldif
chown -R ldap.ldap /etc/openldap/slapd.d/
chown -R ldap.ldap /var/lib/ldap
cp /opt/docker/ldap.conf /etc/openldap/.
