#!/bin/bash

: ${HOME_USER:=none}

git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER

/bin/bash