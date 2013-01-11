tony:
  user.present:
    - fullname: Tony N 
    - shell: /bin/bash
    - home: /home/tony
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
