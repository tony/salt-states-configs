include:
  - vcs.git

tmux-config:
   git.latest:
     - name: git://github.com/tony/tmux-config.git
     - runas: {{ pillar['username'] }}
     - target: /home/{{ pillar['username'] }}/.tmux
     - submodules: true
     - require:
       - pkg: git

tmux:
    pkg:
      - installed

/home/{{ pillar['username'] }}/.tmux.conf:
  file.symlink:
    - target: /home/{{ pillar['username'] }}/.tmux/.tmux.conf
