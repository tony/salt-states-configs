tony:
  user.present:
    - fullname: {{ pillar['fullname'] }}
    - shell: /bin/bash
    - home: /home/{{ pillar['username'] }}
    - gid_from_name: true
    - groups:
      - wheel
      - storage
      - games
      - netdev
      - audio
      - www-data
      - nginx
      - mysql
      - staff
