{% from "uwsgi/map.jinja" import uwsgi with context %}

uwsgi_pip:
  pip.installed:
    - name: {{ salt['pillar.get']('uwsgi:lookup:pip', 'uwsgi') }}

