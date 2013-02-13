# Basic mysql management module. Defaults to installing both client and server
# for three different package providers: debian (as a basis), dotdeb and
# percona.

include:
  - salt.minion.mysql

  {% if pillar["mysql-provider"]|d("debian") != "debian" %}
  - {{ "mysql.%s.server" % pillar["mysql-provider"] }}

  {% else %}

  - mysql.server
  - mysql.config

  {% endif %}
