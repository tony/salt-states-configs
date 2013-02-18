include:
  - mysql.config

extend:
  /etc/mysql/my.cnf:
    file.managed:
      - user: root
      - group: root
      - mode: 0644
      - source: salt://mysql/my.cnf
      - require_in:
        file: /etc/mysql
      - watch_in:
        - service: mysql
