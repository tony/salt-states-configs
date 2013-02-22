include:
  - devel.git 

dircolors-solarized:
   git.latest:
     - name: https://github.com/seebi/dircolors-solarized.git
     - runas: {{ pillar['username'] }}
     - target: /home/{{ pillar['username'] }}/.dircolors-solarized
     - submodules: true
     - require:
       - pkg: git

/home/{{ pillar['username'] }}/.dircolors-solarized:
  file.directory:
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
    - require:
      - git: dircolors-solarized
