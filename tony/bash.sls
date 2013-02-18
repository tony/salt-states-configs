# todo, make it so tony-salt-configs (in a separate repository)
# extends bash/vim/etc anything with a configuration

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
