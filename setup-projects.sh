#!/bin/bash
source ~/oslogin.sh admin secret admin

openstack project create blue-team --domain default 2>/dev/null || echo "blue-team exists"
openstack project create red-team --domain default 2>/dev/null || echo "red-team exists"

openstack user create --password Pass1234 alice --domain default 2>/dev/null || echo "alice exists"
openstack user create --password Pass1234 bob --domain default 2>/dev/null || echo "bob exists"
openstack user create --password Pass1234 mallory --domain default 2>/dev/null || echo "mallory exists"
openstack user create --password Pass1234 auditor1 --domain default 2>/dev/null || echo "auditor1 exists"

openstack role add --user alice --project blue-team member
openstack role add --user bob --project red-team member
openstack role add --user mallory --project red-team member
openstack role add --user auditor1 --project blue-team reader

echo "Done!"
openstack project list
openstack user list
