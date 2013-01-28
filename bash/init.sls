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

dircolors-solarized:
   git.latest:
     - name: https://github.com/seebi/dircolors-solarized.git
     - runas: tony
     - target: /home/tony/.dircolors-solarized
     - submodules: true
     - require:
       - pkg: git

/home/tony/.dircolors-solarized:
  file.directory:
    - user: tony 
    - group: tony
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
    - require:
      - git: dircolors-solarized
