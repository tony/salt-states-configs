base:
    '*':
       #- user.*
       - bash
       - deploy.*
       - vcs.*
       - ruby
       - vim
       - tmux
       - fortune
       - markup.*
       - salt
       - projects.*
    'wuwei':
       - salt.master
       - study.*
       - gtk_theme
       - awesome
       - playonlinux
       - nodejs
       - nodejs.phantomjs
       - spotify
       - media.*
       - ibus
       - rxvt-unicode


# cleansys 
# sudo rm -rf ~/.bashrc ~/.bashprompt ~/.tmux.conf ~/.tmux ~/.fonts ~/.config/awesome ~/.vim ~/.vimrc \
# && sudo apt-get purge -y vim git exuberant-ctags  awesome rxvt-unicode fortune-mod cowsay tmux
