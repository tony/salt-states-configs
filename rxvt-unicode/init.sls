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
    - mode: 644
