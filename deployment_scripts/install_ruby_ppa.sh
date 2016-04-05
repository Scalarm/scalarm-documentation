#!/bin/bash
source `dirname $0`/utils.sh

if ruby --version
then
  info "Ruby already installed: $(ruby --version)"
else
  info "Adding ppa:brightbox/ruby-ng repository"
  execute sudo apt-get -y install software-properties-common
  execute sudo add-apt-repository -y ppa:brightbox/ruby-ng
  execute sudo apt-get update

  info "Installing ruby from ppa:brightbox/ruby-ng repository"
  execute sudo apt-get install ruby2.1 ruby2.1-dev

  info "Checking installed ruby version"
  execute ruby --version
fi
