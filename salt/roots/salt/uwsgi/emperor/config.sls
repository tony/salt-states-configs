{% from "uwsgi/map.jinja" import uwsgi, sls_block with context %}

include:
  - uwsgi.emperor

uwsgi_emperor_dir:
  file.directory:
    - name: {{ uwsgi.lookup.emperor_dir }}
    - user: root
    - group: root
    - mode: 755

uwsgi_emperor_config:
  file.managed:
    {{ sls_block(uwsgi.emperor.opts) }}
    - name: {{ uwsgi.lookup.emperor_dir}}/{{ uwsgi.lookup.emperor_config }}
    - source: salt://uwsgi/emperor/files/emperor.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - context:
        config: {{ uwsgi.emperor.config|json() }}
    - require:
      - file: uwsgi_emperor_dir
