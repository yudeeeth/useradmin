#!/bin/bash

#since home directories of users in groups are set to 700,
#no user can modify another user's files.
#we give special access to the heads of each group usinf access control lists
cd /home
setfacl -Rm u:NavyMarsall:rwx /home/navy
setfacl -Rm u:ArmyGeneral:rwx /home/army
setfacl -Rm u:AirForceChief:rwx /home/airforce

#similarly give special control to chiefcommander to all three directories

setfacl -Rm u:ChiefCommander:rwx /home/navy
setfacl -Rm u:ChiefCommander:rwx /home/army
setfacl -Rm u:ChiefCommander:rwx /home/airforce
cd /root/userad
#setfacl seems a lot cleaner than having to assign groups to every single troop and linking them with troop leaders