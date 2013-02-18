mysql-common:
  pkg.installed:
    - name: mysql-common

/etc/mysql:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - clear: True
    - require:
      - file: /etc/mysql/conf.d
      - pkg: mysql-common

/etc/mysql/conf.d:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - clear: True
    - require:
      - pkg: mysql-common
