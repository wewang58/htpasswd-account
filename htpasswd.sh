#!/bin/bash
if [ $# -eq 0 ];then
  echo "Please provide masterhost when execute the script!"
  exit
else 
  for i in $@
  do
    echo "Add or update htpasswd accounts to host:$i" 
    #You can replace "devexp" for other username prefix, also can change password "redhat" 
    #Change the path of libre-new.pem 
    ssh -i /home/wewang/libra-new.pem root@$i 'for i in {1..4};do htpasswd -b /etc/origin/master/htpasswd devexp$i redhat; done'
  done 
fi

