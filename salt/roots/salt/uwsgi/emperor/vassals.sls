{% from 'uwsgi/map.jinja' import uwsgi, sls_block with context %}
{% from 'uwsgi/emperor/vassal_config.sls' import vassal_states with context %}
{% from 'uwsgi/emperor/service.sls' import service_function with context %}

{% macro file_requisites(states) %}
      {%- for state in states %}
      - file: {{ state }}
      {%- endfor -%}
{% endmacro %}

include:
  - uwsgi.emperor.service
  - uwsgi.emperor.vassal_config

{% if vassal_states|length() > 0 %}
uwsgi_emperor_service_reload:
  service.{{ service_function }}:
    - name: {{ uwsgi.lookup.emperor_service }}
    - reload: True
    - use:
      - service: uwsgi_emperor_service
    - watch:
      {{ file_requisites(vassal_states) }}
    - require:
      {{ file_requisites(vassal_states) }}
      - service: uwsgi_emperor_service
{% endif %}
