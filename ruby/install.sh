#!/bin/bash
### RVM
# Check if RVM is installed, and install it if it's not.
if ! command -v rvm; then
  # Do NOT alter our dotfiles during install.
  export rvm_ignore_dotfiles=yes
  # Install the stable version.
  \curl -sSL https://get.rvm.io | bash -s stable --ruby  
fi
