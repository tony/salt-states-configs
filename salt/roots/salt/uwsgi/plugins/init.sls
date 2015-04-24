{% from "uwsgi/map.jinja" import uwsgi,sls_block with context %}

uwsgi_plugins:
  pkg.installed:
    {{ sls_block(uwsgi.package.opts) }}
    - pkgs:
      {% for pkg in uwsgi.lookup.plugins %}
      - {{ pkg }}
      {% endfor %}

