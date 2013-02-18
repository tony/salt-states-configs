include:
  - devel.git
  - editors.vim

vim-config:
   git.latest:
     - name: git://github.com/tony/vim-config.git
     - runas: {{ pillar['username'] }}
     - target: /home/{{ pillar['username'] }}/.vim
     - submodules: true
     - require:
       - pkg: git
   file.symlink:
     - name: /home/{{ pillar['username'] }}/.vimrc
     - target: /home/{{ pillar['username'] }}/.vim/.vimrc
     - require:
       - git: vim-config
