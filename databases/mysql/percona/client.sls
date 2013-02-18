include :
  - mysql.percona.common
  - mysql.client

extend:
  mysql-client:
    pkg.installed:
      - name: {{ "percona-server-client" if pillar["mysql-version"] is not defined else "percona-server-client-%s" % pillar["mysql-version"] }}
