/testing/guestbin/swan-prep --nokeys

# Generate west's CA and then use that to generate a signed
# cert+private-key that east can present when authenticating.  All
# dates for these certs are sane.

certutil -m 1 -S -k rsa -x         -n west-ca -s "CN=west-ca"  -v 12 -t "CT,C,C" -d /etc/ipsec.d -z ipsec.conf
certutil -m 2 -S -k rsa -c west-ca -n east    -s "CN=east" -v 12 -t "u,u,u"  -d /etc/ipsec.d -z ipsec.conf
pk12util -W secret -o OUTPUT/east.p12 -n east -d /etc/ipsec.d
certutil -L -n east -d /etc/ipsec.d -a > OUTPUT/east.crt
certutil -F -n east -d /etc/ipsec.d