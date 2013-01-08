include:
  - vcs.git

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
     - require:
       - pkg: git

vim:
    require:
      - pkg: vim-deps
    pkg:
      - installed

/home/tony/.vimrc:
  file.symlink:
    - target: /home/tony/.vim/.vimrc
