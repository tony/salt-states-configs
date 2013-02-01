/home/{{ pillar['username'] }}/.gtkrc-2.0:
  file.managed:
    - source: salt://gtk_theme/gtkrc-2.0
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 644

/home/{{ pillar['username'] }}/.gtkrc-2.0.mine:
  file.managed:
    - source: salt://gtk_theme/gtkrc-2.0.mine
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 644

lxappearance:
  pkg.installed:
    - names:
      - lxappearance

gtk_themes:
   pkg.installed:
     - names:
       - gtk2-engines
