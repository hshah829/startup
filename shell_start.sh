#!/bin/bash


cat <<EOF >> $HOME/.zshrc
#Boot2docker insecure registry
if boot2docker ssh [ -s /var/lib/boot2docker/profile ];
 then
   echo "File boot2docker/profile exists";
 else
  echo "File boot2docker/profile does not exist and adding insecure registry flag" && boot2docker ssh 'sudo sh -c "echo \"EXTRA_ARGS=\\\\\"--insecure-registry index.loyal3.net:5000\\\\\"\" > /var/lib/boot2docker/profile && sudo /etc/init.d/docker restart"';
 fi

#Declare boot2docker variables in shell
eval "\$(boot2docker shellinit)"
EOF
