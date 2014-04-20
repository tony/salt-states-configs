users:

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

absent_users:
  - donald
  - bad_guy
  - auser
