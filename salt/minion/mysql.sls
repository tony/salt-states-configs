include: 
  - salt.minion

python-mysqldb:
  pkg:
    - installed

/etc/salt/minion.d/mysql.conf:
  file.managed:
    - source: salt://salt/minion/mysql.conf
    - user: root
    - group: root
    - mode: 0644
    - require_in: 
      - file: /etc/salt/minion.d
    - require:
      - pkg: mysql-server
      - pkg: python-mysqldb
    - watch_in:
      - cmd: restart_minion
