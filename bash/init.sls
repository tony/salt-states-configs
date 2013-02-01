/home/{{ pillar['username'] }}/.bashrc:
  file.managed:
    - source: salt://bash/bashrc
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 644

/home/{{ pillar['username'] }}/.bash_prompt:
  file.managed:
    - source: salt://bash/bash_prompt
    - user: {{ pillar['username'] }} 
    - group: {{ pillar['username'] }}
    - mode: 644

dircolors-solarized:
   git.latest:
     - name: https://github.com/seebi/dircolors-solarized.git
     - runas: {{ pillar['username'] }}
     - target: /home/{{ pillar['username'] }}/.dircolors-solarized
     - submodules: true
     - require:
       - pkg: git

dircolors-solarized-perms:
  cmd.run:
    - name: chmod -R 755 /home/{{ pillar['username'] }}/.dircolors-solarized
    - runas: {{ pillar['username'] }}

/home/{{ pillar['username'] }}/.dircolors-solarized:
  file.directory:
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
    - require:
      - git: dircolors-solarized
