# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    env_setup.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mazoukni <mazoukni@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/13 13:45:20 by mazoukni          #+#    #+#              #
#    Updated: 2021/04/15 15:28:05 by mazoukni         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

DOCKER_HOME=$HOME/.docker
DOCKER_GOINFRE=/goinfre/$1/.docker
HOMEBREW_HOME=/goinfre/$1/homebrew

if [ ! -d "/Users/$1/.oh-my-zsh" ]
then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo " " > ~/.zshrc
echo "export ZSH=\"/Users/$1/.oh-my-zsh\"" >> ~/.zshrc
echo "ZSH_THEME=\"robbyrussell\"" >> ~/.zshrc
echo "plugins=(git)"  >> ~/.zshrc
echo "source $ZSH/oh-my-zsh.sh" >> ~/.zshrc
source ~/.zshrc

if [[ -d $DOCKER_GOINFRE || -d $HOMEBREW_HOME ]]
then
    echo "-------------- Deleting Old Cashes ---------------"
    rm -rf $DOCKER_GOINFRE
    rm -rf $HOMEBREW_HOME
fi
mkdir $HOMEBREW_HOME && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOMEBREW_HOME
echo "export PATH=$PATH:$HOMEBREW_HOME/bin" >> ~/.zshrc
source ~/.zshrc
curl -Lo /goinfre/$1/minikube https://storage.googleapis.com/minikube/releases/v0.27.0/minikube-darwin-amd64
chmod +x /goinfre/$1/minikube
echo "export PATH=$PATH:/goinfre/$1" >> ~/.zshrc
echo "export MINIKUBE_HOME=/goinfre/$1" >> ~/.zshrc
echo "export KUBECONFIG=/goinfre/$1/.kube/config"
source ~/.zshrc
brew update
brew install docker docker-machine
mkdir $DOCKER_GOINFRE
ls -s $DOCKER_GOINFRE $DOCKER_HOME
source ~/.zshrc
docker-machine create --driver virtualbox default
docker-machine start
docker-machine env default
eval "$(docker-machine env default)"
source ~/.zshrc
brew install kubectl
if [ -d "$HOME/.minikube" ]
then
    echo "--------- Deleting Minikube Old Directory -----------"
    rm -rf $HOME/.minikube
fi
minikube start --vm-driver=virtualbox
source ~/.zshrc
