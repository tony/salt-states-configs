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

awesome-config-autorun:
  file.managed:
    - name: /home/{{ pillar['username'] }}/.config/awesome/autorun.lua
    - source: salt://tony/home/.config/awesome/autorun.lua
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 644
    - require:
      - git: awesome-config
