include:
  - vcs.git

tmux-config:
   git.latest:
     - name: git://github.com/tony/tmux-config.git
     - runas: tony
     - target: /home/tony/.tmux
     - submodules: true
     - require:
       - pkg: git

tmux:
    pkg:
      - installed

/home/tony/.tmux.conf:
  file.symlink:
    - target: /home/tony/.tmux/.tmux.conf
