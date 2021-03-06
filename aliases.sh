#!/bin/bash

#sets alias and calls preconfig automatically.
#alias called in dockerfile when creating image, so no need to re-source .bashrc

alias userGenerate="bash /root/userad/createuser.sh && ./preconfig.sh"
alias permit="bash /root/userad/setpermisssions.sh"
alias autoSchedule="bash /root/userad/assignpos.sh"
alias attendance="bash /root/userad/setattendance.sh"
alias record="bash $HOME/fetch.sh"
alias nearest="bash /root/userad/nearest.sh"
alias finalattendance="bash /root/userad/dailyattendance.sh"
