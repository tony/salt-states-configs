{% from "www/uwsgi/map.jinja" import uwsgi with context %}

include:
  - lang.python

uwsgi_pip:
  pip.installed:
    - name: {{ salt['pillar.get']('uwsgi:lookup:pip', 'uwsgi') }}
    - require:
      - pkg: python-pip
