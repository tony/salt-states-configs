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
     - runas: {{ pillar['username'] }}
     - target: /home/{{ pillar['username'] }}/.vim
     - submodules: true
     - require:
       - pkg: git

vim:
    require:
      - pkg: vim-deps
    pkg:
      - installed

/home/{{ pillar['username'] }}/.vimrc:
  file.symlink:
    - target: /home/{{ pillar['username'] }}/.vim/.vimrc
