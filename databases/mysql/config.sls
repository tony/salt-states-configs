/etc/mysql/my.cnf:
  file.exists:
    - require_in:
      file: /etc/mysql
    - watch_in:
      - service: mysql-server
