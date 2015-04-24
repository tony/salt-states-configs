{% from "uwsgi/map.jinja" import uwsgi, sls_block with context %}
{% set service_function = {True:'running', False:'dead'}.get(uwsgi.service.enable) %}


include:
  - uwsgi.emperor.install

uwsgi_emperor_service:
  service.{{ service_function }}:
    {{ sls_block(uwsgi.service.opts) }}
    - name: {{ uwsgi.lookup.emperor_service }}
    - enable: {{ uwsgi.service.enable }}
    - require:
      - sls: uwsgi.emperor.install
    - watch:
      - pkg: uwsgi_emperor_install
