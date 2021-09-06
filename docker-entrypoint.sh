#!/bin/bash

: ${HOME_USER:=none}

git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER

if[ $HOME_USER!=none ];
then
    cp -R /home/$HOME_USER/.ssh /root/.ssh
fi

/bin/bash