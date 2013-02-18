include:
  - wm.awesome
  - devel.git

awesome-config:
   git.latest:
     - name: git://github.com/tony/awesome-config.git
     - runas: tony
     - target: /home/{{ pillar['username'] }}/.config/awesome
     - submodules: true
     - require:
       - pkg: git
