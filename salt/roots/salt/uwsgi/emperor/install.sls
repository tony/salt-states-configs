{% from "uwsgi/map.jinja" import uwsgi, sls_block with context %}

uwsgi_emperor_install:
  pkg.installed:
    {{ sls_block(uwsgi.package.opts) }}
    - name: {{ uwsgi.lookup.emperor_pkg }}
