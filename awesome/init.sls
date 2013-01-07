awesome:
    pkg:
      - installed
    require:
      - pkg: git

awesome-config:
   git.latest:
     - name: git://github.com/tony/awesome-config.git
     - runas: tony
     - target: /home/tony/.config/awesome
     - submodules: true
