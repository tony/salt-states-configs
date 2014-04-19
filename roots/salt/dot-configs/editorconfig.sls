/home/{{ pillar['username'] }}/.editorconfig:
  file.managed:
    - source: salt://tony/home/.editorconfig
    - user: {{ pillar['username'] }} 
    - group: {{ pillar['username'] }}
    - mode: 644
