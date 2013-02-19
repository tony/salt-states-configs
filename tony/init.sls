include:
  - webserver

tony:
  user.present:
    - fullname: {{ pillar['fullname'] }}
    - shell: /bin/bash
    - home: /home/{{ pillar['username'] }}
    - gid_from_name: true
    - groups:
      - games
      - audio
      - www-data
      - mysql
      - staff
      - adm
      - sudo
      - plugdev
      - lpadmin
      - sambashare
      - netdev
      - cdrom
  require:
    - group: www-data
