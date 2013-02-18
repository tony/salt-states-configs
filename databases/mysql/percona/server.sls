include:
  - mysql.percona.client
  - mysql.server

extend:
  mysql-server:
    pkg.installed:
      - name: percona-server-server
      - name: {{ "percona-server-server" if pillar["mysql-version"] is not defined else "percona-server-server-%s" % pillar["mysql-version"] }}
