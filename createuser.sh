#!/bin/bash

#addgroups
addgroup army navy airforce
#set SET_GIDHOME=yes and DIR_MODE=700 to creat new users under /home/group/username
sed -i '/^SETGID_HOME/d' /etc/adduser.conf
echo "SETGID_HOME=yes" >> /etc/adduser.conf
sed -i '/^DIR_MODE/d' /etc/adduser.conf
echo "DIR_MODE=700" >> /etc/adduser.conf

i=1
while [ $i -le 50 ]
do
  a="Army$i"
  af="AirForce$i"
  n="Navy$i"
#adding user using adduser and then redirecting output to shell using <<
  adduser --ingroup army --force-badname $a <<EOF
army123
army123
$a



y
EOF

  adduser --ingroup navy --force-badname $n <<EOF
navy123
navy123
$n



y
EOF

adduser --ingroup airforce --force-badname $af <<EOF
airforce123
airforce123
$af



y
EOF

i=$(($i + 1))
done

adduser --ingroup army ArmyGeneral <<EOF
ArmyGeneral123
navy123
Army General



y
EOF

adduser --ingroup navy NavyMarsall <<EOF
NavyMarsall123
NavyMarsall123
Navy Marshall



y
EOF

adduser --ingroup airforce AirForceChief <<EOF
AirForceChief123
AirForceChief123
AirForce Chief



y
EOF

#set SETGID_HOME to no.
sed -i '/^SETGID_HOME/d' /etc/adduser.conf
echo "SETGID_HOME=no" >> /etc/adduser.conf

adduser ChiefCommander <<EOF
ChiefCommander4321
ChiefCommander4321
Chief Commander



y
EOF

echo "154 users created successfully"
