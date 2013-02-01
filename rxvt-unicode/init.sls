include:
  - fonts

rxvt-unicode:
  pkg:
    - installed
    - name: rxvt-unicode-256color

/home/{{ pillar['username'] }}/.Xdefaults:
  file.managed:
    - source: salt://rxvt-unicode/Xdefaults
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 755

/home/{{ pillar['username'] }}/.Xresources:
  file.managed:
    - source: salt://rxvt-unicode/Xresources
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 755

/home/{{ pillar['username'] }}/.xinitrc:
  file.managed:
    - source: salt://rxvt-unicode/xinitrc
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 755
