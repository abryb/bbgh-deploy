#!/usr/bin/env bash
username="$1"

if [ "$username" == "" ]; then
  echo -e "Usage:\n$0 <username>"
  exit 1
fi

if  id "$username"  > /dev/null ; then
    echo "User $username already exsits"
    exit 2
fi

useradd $username
passwd $username
mkhomedir_helper $username
usermod --shell /bin/bash $username
usermod -aG docker $username
usermod -aG sudo $username
