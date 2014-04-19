include:
  - sysutils.tmux
  - devel.git

tmux-config:
    git.latest:
      - name: git://github.com/tony/tmux-config.git
      - runas: {{ pillar['username'] }}
      - target: /home/{{ pillar['username'] }}/.tmux
      - submodules: true
      - require:
        - pkg: git
        - pkg: tmux
    file.symlink:
      - name: /home/{{ pillar['username'] }}/.tmux.conf
      - target: /home/{{ pillar['username'] }}/.tmux/.tmux.conf
      - require:
        - git: tmux-config
