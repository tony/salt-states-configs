include: 
  - .minion

python-mysqldb:
  pkg:
    - installed

/etc/salt/minion.d/mysql.conf:
  file.managed:
    - source: salt://salt/mysql.conf
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: mysql-server
      - pkg: python-mysqldb
