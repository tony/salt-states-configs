/home/tony/.bashrc:
  file.managed:
    - source: salt://bash/bashrc
    - user: tony 
    - group: tony 
    - mode: 644

/home/tony/.bash_prompt:
  file.managed:
    - source: salt://bash/bash_prompt
    - user: tony 
    - group: tony 
    - mode: 644
