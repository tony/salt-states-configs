/home/tony/.gtkrc-2.0:
  file.managed:
    - source: salt://gtk_theme/gtkrc-2.0
    - user: tony 
    - group: tony 
    - mode: 644

/home/tony/.gtkrc-2.0.mine:
  file.managed:
    - source: salt://gtk_theme/gtkrc-2.0.mine
    - user: tony 
    - group: tony 
    - mode: 644

lxappearance:
  pkg.installed:
    - names:
      - lxappearance

gtk_themes:
   pkg.installed:
     - names:
       - gtk2-engines
