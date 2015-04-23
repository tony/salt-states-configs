{% from 'www/uwsgi/map.jinja' import uwsgi, sls_block with context %}
{% from 'www/uwsgi/application_config.sls' import application_states with context %}
{% from 'www/uwsgi/service.sls' import service_function with context %}

{% macro file_requisites(states) %}
      {%- for state in states %}
      - file: {{ state }}
      {%- endfor -%}
{% endmacro %}

include:
  - .service
  - .application_config

{% if application_states|length() > 0 %}
uwsgi_service_reload:
  service.{{ service_function }}:
    - name: {{ uwsgi.lookup.uwsgi_service }}
    - reload: True
    - use:
      - service: uwsgi_service
    - watch:
      {{ file_requisites(application_states) }}
    - require:
      {{ file_requisites(application_states) }}
      - service: uwsgi_service
{% endif %}
