include:
  - devel.git
  - x11.konsole

konsole-config:
  git.latest:
    - name: https://github.com/phiggins/konsole-colors-solarized.git
    - runas: {{ pillar['username'] }}
    - target: /home/{{ pillar['username'] }}/.kde4/share/apps/konsole/solarized
    - submodules: true
    - require:
      - pkg: git
      - pkg: vim
  file.directory:
    - name: /home/{{ pillar['username'] }}/.kde4/share/apps/konsole
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 755
    - makedirs: true
    - require:
      - git: konsole-config
