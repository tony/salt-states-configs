include:
  - devel.git 
  - lang.ruby

/home/{{ pillar['username'] }}/.teamocil:
  file.recurse:
    - source: salt://tony/home/.teamocil
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - file_mode: 744
    - dir_mode: 744
    - makedirs: True
    - include_empty: True
    - recurse:
      - user
      - group
