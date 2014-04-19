users:

## Full list of pillar values
  tony:
    fullname: Tony Narlock
    home: /home/tony
    sudouser: True
    shell: /bin/zsh
    groups:
      - tony
      - cdrom
      - floppy
      - audio
      - dip
      - video
      - plugdev
      - netdev
      - scanner
      - bluetooth
      - bpadmin
    prime_group:
      name: tony
      gid: 1000
  tonytest:
    fullname: TonyTest
    home: /home/tonytest
    sudouser: False
    sudo_rules: 
      - ALL=(root) /usr/bin/find
      - ALL=(otheruser) /usr/bin/script.sh
    shell: /bin/zsh
    prime_group:
      name: tonytest
      gid: 500
    groups:
      - users
    ssh_key_type: rsa
    ssh_keys:
      privkey: PRIVATEKEY
      pubkey: PUBLICKEY
    ssh_auth:
      - PUBLICKEY

absent_users:
  - donald
  - bad_guy
  - auser
