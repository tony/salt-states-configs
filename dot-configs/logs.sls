{{ pillar['logs_dir'] }}:
  file.directory:
    - user: syslog
    - group: adm 
    - file_mode: 664 
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
