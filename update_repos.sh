#!/bin/bash

#Update all the git repos from the parent directory recursively upto one level
logfile='/var/log/git_update/run_log.log'
Directory='/var/log/git_update'

echo "Starting Update"
if [ -d "$Directory" ]; then
   if [ -f "$logfile" ]; then
      echo "Logfile and Directory exists" 
   else
      echo "Creating logfile" 
      sudo touch ${logfile} && sudo chmod 777 ${logfile}
   fi
else
     echo "Creating Directory and logfile"
     sudo mkdir ${Directory} && sudo chmod 777 ${Directory}
     sudo touch ${logfile} && sudo chmod 777 ${logfile}
fi

cd /Users/hardik/Projects
pwd

{ for dir in $(find . -name ".git"); do cd ${dir%/*}; git pull ;echo ${dir}; cd -; done } >> ${logfile}

echo "--------------------------------------------------------------------------------------------------------------"
echo
echo $?
   if (($? == 1)); then
        printf '%s\n' 'There was an error while running the update. Please look at the logs' >>"$logfile"
    else
        echo "All repositories update"
    fi
        echo 'logs can be found in ${logfile}'
echo "Update complete"
