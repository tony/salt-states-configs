include:
  - sysutils.uwsgi
  - www.supervisor

/etc/supervisor/supervisord.conf:
  file.managed:
    - source: salt://www/uwsgi/etc/supervisor/supervisord.conf
    - require:
      - pkg: uwsgi
      - pkg: supervisor
