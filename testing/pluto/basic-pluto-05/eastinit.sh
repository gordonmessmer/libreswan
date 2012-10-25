#!/bin/sh
: ==== start ====
TESTNAME=basic-pluto-05
source /testing/pluto/bin/eastlocal.sh

#paul arp -s 192.0.2.1 10:00:00:dc:bc:01

ipsec setup start
/testing/pluto/bin/wait-until-pluto-started

ipsec auto --add northnet--eastnet-nat
echo "initdone"
