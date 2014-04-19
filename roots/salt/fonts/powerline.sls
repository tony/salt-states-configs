include:
  - devel.git

powerline-fonts:
  git.latest:
    - name: git://github.com/Lokaltog/powerline-fonts.git
    - runas: {{ pillar['username'] }}
    - target: /home/{{ pillar['username'] }}/.fonts/powerline
    - submodules: true
    - require:
      - pkg: git
  cmd.run:
    - name: fc-cache -fv
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - cwd: /home/{{ pillar['username'] }}
    - require:
      - git: powerline-fonts
