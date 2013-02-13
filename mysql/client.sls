include :
  - mysql.common

mysql-client:
  pkg.installed:
    - name: {{ "mysql-client" if pillar["mysql-version"] is not defined else "mysql-client-%s" % pillar["mysql-version"] }}

/etc/mysql/conf.d/client-encoding-and-collation.cnf:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://mysql/client-encoding-and-collation.cnf
    - require:
      - pkg: mysql-client
    - require_in:
      - file: /etc/mysql/conf.d

