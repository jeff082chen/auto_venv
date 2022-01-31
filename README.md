# auto_venv
automatically activate/deactivate your python virtual environment while cd between directory

# requirements
+ the name of virtual environment must be .venv
  + or you can change that in the source code
+ there's no nested virtual environment
  + if a directory already has a .venv, it's subdirectorys can't have other .venv
  
# how to use
``` zsh
# clone the project
$ git clone git@github.com:jeff082chen/auto_venv.git

$ cd auto_venv

# add the code into .zshrc
# or .bashrc if you are using bash, etc.
$ cat auto_venv.sh >> ~/.zshrc

$ source ~/.zshrc
```
