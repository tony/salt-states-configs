include:
  - mysql.common
  - apt.percona

extend:
  mysql-common:
    pkg.installed:
      - name: {{ "percona-server-common" if pillar["mysql-version"] is not defined else "percona-server-common-%s" % pillar["mysql-version"] }}
