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
      - pkg: vim
  file.symlink:
    - name: /home/{{ pillar['username'] }}/.vimrc
    - target: /home/{{ pillar['username'] }}/.vim/.vimrc
    - require:
      - git: vim-config

vim-localconf:
  file.managed:
    - name: /home/{{ pillar['username'] }}/.vimrc.local
    - source: salt://tony/home/.vimrc.local
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 644
    - require:
      - git: vim-config
