include:
  - webserver
  - databases.mysql.group
  - emulators.virtualbox.group

tony:
  user.present:
    - fullname: {{ pillar.get('fullname', pillar.get('username', 'user')) }}
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
      - vboxusers
    - require:
      - group: www-data
      - group: vboxusers_group
      - group: mysql_group
