uwsgi:
  pkg:
    - installed

/etc/logrotate.d/uwsgi:
  file.managed:
    - source: salt://sysutils/uwsgi/etc/logrotate.d/uwsgi
    - require:
      - pkg: uwsgi
