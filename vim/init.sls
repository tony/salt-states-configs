vim-deps:
   pkg.installed:
     - names:
       - exuberant-ctags
     - require_in:
       - pkg: vim

vim-config:
   git.latest:
     - name: git://github.com/tony/vim-config.git
     - runas: tony
     - target: /home/tony/.vim
     - submodules: true
     #- require_in:
     #  - git: vim-vundle


#vim-vundle:
#   git.latest:
#     - name: git://github.com/gmarik/vundle.git
#     - runas: tony
#     - target: /home/tony/.vim/bundle/vundle
#     - submodules: true
     #- require_in:
     #  - cmd: Run vundle

git:
  pkg:
    - installed
    - require_in:
      #- git: vim-vundle
      - git: vim-config

vim:
    require:
      - pkg: vim-deps
    pkg:
      - installed
      #- require_in:
      #  - cmd: Run vundle

/home/tony/.vimrc:
  file.symlink:
    - target: /home/tony/.vim/.vimrc
  #require:
  #  - cmd: Run vundle

# this works perfect with salt-call
#Run vundle:
#    cmd.run:
#      - name: /usr/bin/vim -u /home/tony/.vim/bundles.vim +BundleInstall +BundleClean +qall && echo 1
#      - user: tony
#      - group: tony
#      - cwd: /home/tony/.vim

#Run vundle:
#    cmd.run:
#      - name: empty -f /usr/bin/vim -u /home/tony/.vim/bundles.vim +BundleInstall +BundleClean +qall && echo 1
#      - user: tony
#      - group: tony
#      - cwd: /home/tony/.vim
