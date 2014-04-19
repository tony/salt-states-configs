base:
  '*':
      - editors.*
  'wuwei':
      - salt.master
      - tony.*
  'x200t':
      - salt.minion
      - tony.*

# cleansys 
# sudo rm -rf ~/.bashrc ~/.bashprompt ~/.tmux.conf ~/.tmux ~/.fonts ~/.config/awesome ~/.vim ~/.vimrc \
# && sudo apt-get purge -y vim git exuberant-ctags  awesome rxvt-unicode fortune-mod cowsay tmux
