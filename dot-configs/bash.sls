/home/{{ pillar['username'] }}/.bashrc:
  file.managed:
    - source: salt://tony/home/.bashrc
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - mode: 644

/home/{{ pillar['username'] }}/.bash_prompt:
  file.managed:
    - source: salt://tony/home/.bash_prompt
    - user: {{ pillar['username'] }} 
    - group: {{ pillar['username'] }}
    - mode: 644
