include:
  - vcs.git

awesome:
    pkg:
      - installed
    require:
      - pkg.installed:
        - names:
          - feh

awesome-config:
   git.latest:
     - name: git://github.com/tony/awesome-config.git
     - runas: tony
     - target: /home/{{ pillar['username'] }}/.config/awesome
     - submodules: true
     - require:
       - pkg: git
