#!/bin/bash

set -exu

# identify with ssh key
git config --global user.name yeon
git config --global user.email mail@yeons.io
git config --global core.sshCommand "ssh -i $GIT_PRIVATE_KEY"

# use vim
git config --global core.editor vim

# master -> main
git config --global init.defaultBranch main

# enable commit signing with ssh key
git config --global gpg.format ssh
git config --global user.signingkey $GIT_PUBLIC_KEY
git config --global commit.gpgsign true

echo "$(git config --get user.email) namespaces=\"git\" $(cat $GIT_PUBLIC_KEY)" > allowed_signers

git config --global gpg.ssh.allowedSignersFile "$(pwd)/allowed_signers"

