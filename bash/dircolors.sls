include:
  - bash

dircolors-solarized:
   git.latest:
     - name: https://github.com/seebi/dircolors-solarized.git
     - runas: {{ pillar['username'] }}
     - target: /home/{{ pillar['username'] }}/.dircolors-solarized
     - submodules: true
     - require:
       - pkg: git

#dircolors-solarized-perms:
  #cmd.run:
    #- name: chmod -R 755 /home/{{ pillar['username'] }}/.dircolors-solarized
    #- runas: {{ pillar['username'] }}

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
