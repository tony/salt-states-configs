include:
  - wm.gtk
  
/home/{{ pillar['username'] }}/.gtkrc-2.0:
  file.managed:
    - source: salt://tony/home/.gtkrc-2.0
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 644
  require:
    - pkg: gtk2-engines

/home/{{ pillar['username'] }}/.gtkrc-2.0.mine:
  file.managed:
    - source: salt://tony/home/.gtkrc-2.0.mine
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 644
  require:
    - pkg: gtk2-engines
