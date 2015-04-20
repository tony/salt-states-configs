include:
  - www.uwsgi
  - sysutils.supervisor

/etc/supervisor/supervisord.conf:
  file.managed:
    - source: salt://www/uwsgi/etc/supervisor/supervisord.conf
    - require:
      - pip: uwsgi
      - pkg: supervisor
