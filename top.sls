base:
    '*':
       #- user.*
       - bash
       - ibus
       - deploy.*
       - vcs.*
       - ruby
       - vim
       - awesome
       - tmux
       - rxvt-unicode
       - gtk_theme
       - fortune
       - media.*
       - playonlinux
       - nodejs
       - nodejs.phantomjs
       - spotify
       - markup.*
       - salt
       - projects.*
    'wuwei':
       - salt.master

# cleansys 
# sudo rm -rf ~/.bashrc ~/.bashprompt ~/.tmux.conf ~/.tmux ~/.fonts ~/.config/awesome ~/.vim ~/.vimrc \
# && sudo apt-get purge -y vim git exuberant-ctags  awesome rxvt-unicode fortune-mod cowsay tmux
