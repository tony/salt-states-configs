include:
  - fonts

rxvt-unicode:
  pkg:
    - installed

/home/tony/.Xdefaults:
  file.managed:
    - source: salt://rxvt-unicode/Xdefaults
    - user: tony 
    - group: tony 
    - mode: 755

/home/tony/.Xresources:
  file.managed:
    - source: salt://rxvt-unicode/Xresources
    - user: tony 
    - group: tony 
    - mode: 755

/home/tony/.xinitrc:
  file.managed:
    - source: salt://rxvt-unicode/xinitrc
    - user: tony 
    - group: tony 
    - mode: 755
