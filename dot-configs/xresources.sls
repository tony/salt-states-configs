/home/{{ pillar['username'] }}/.Xresources:
  file.managed:
    - source: salt://tony/home/.Xresources
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 755

/home/{{ pillar['username'] }}/.xinitrc:
  file.managed:
    - source: salt://tony/home/.xinitrc
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 755
