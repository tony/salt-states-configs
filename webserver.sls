/var/www:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 775
    - makedirs: True
    - require:
      - group: www-data


www-data:
  group.present:
    - system: True

{{ pillar['username'] }}:
  user.present:
    - groups:
      - www-data
      - adm
      - sudo
      - plugdev
      - lpadmin
      - sambashare
      - netdev
      - cdrom
  require:
    - group: www-data
