#!/bin/bash

#since home directories of users in groups are set to 700,
#no user can modify another user's files.
#we give special access to the heads of each group usinf access control lists

setfacl -Rm u:NavyMarsall:rmx /home/navy
setfacl -Rm u:ArmyGeneral:rmx /home/army
setfacl -Rm u:AirForceChief:rmx /home/airforce

#similarly give special control to chiefcommander to all three directories

setfacl -Rm u:ChiefCommander:rmx /home/navy
setfacl -Rm u:ChiefCommander:rmx /home/army
setfacl -Rm u:ChiefCommander:rmx /home/airforce

#setfacl seems a lot cleaner than having to assign groups to every single troop and linking them with troop leaders