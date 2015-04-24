# uwsgi.application_config
#
# Manages the configuration of uwsgi application files.

{% from 'uwsgi/map.jinja' import uwsgi, sls_block with context %}
{% set application_states = [] %}

# Simple path concatenation.
# Needs work to make this function on windows.
{% macro path_join(file, root) -%}
  {{ root ~ '/' ~ file }}
{%- endmacro %}

# Retrieves the disabled name of a particular application
{% macro disabled_name(application) -%}
  {%- if uwsgi.lookup.application_use_symlink -%}
    {{ uwsgi.applications.managed.get(application).get('disabled_name', application) }}
  {%- else -%}
    {{ uwsgi.applications.managed.get(application).get('disabled_name', application ~ uwsgi.applications.disabled_postfix) }}
  {%- endif -%}
{%- endmacro %}

# Gets the path of a particular application
{% macro application_path(application, state) -%}
  {%- if state == True -%}
    {{ path_join(application, uwsgi.applications.managed.get(application).get('dir', uwsgi.lookup.application_enabled)) }}
  {%- elif state == False -%}
    {{ path_join(disabled_name(application), uwsgi.applications.managed.get(application).get('dir', uwsgi.lookup.application_available)) }}
  {%- else -%}
    {{ path_join(application, uwsgi.applications.managed.get(application).get('dir', uwsgi.lookup.application_available)) }}
  {%- endif -%}
{%- endmacro %}

# Gets the current canonical name of a application
{% macro application_curpath(application) -%}
  {{ application_path(application, uwsgi.applications.managed.get(application).get('available')) }}
{%- endmacro %}

# Creates the sls block that manages symlinking / renaming applications
{% macro manage_status(application, state) -%}
  {%- set anti_state = {True:False, False:True}.get(state) -%}
  {% if state == True %}
    {%- if uwsgi.lookup.application_use_symlink %}
  file.symlink:
    {{ sls_block(uwsgi.applications.symlink_opts) }}
    - name: {{ application_path(application, state) }}
    - target: {{ application_path(application, anti_state) }}
    {%- else %}
  file.rename:
    {{ sls_block(uwsgi.applications.rename_opts) }}
    - name: {{ application_path(application, state) }}
    - source: {{ application_path(application, anti_state) }}
    {%- endif %}
  {%- elif state == False %}
    {%- if uwsgi.lookup.application_use_symlink %}
  file.absent:
    - name: {{ application_path(application, anti_state) }}
    {%- else %}
  file.rename:
    {{ sls_block(uwsgi.applications.rename_opts) }}
    - name: {{ application_path(application, state) }}
    - source: {{ application_path(application, anti_state) }}
    {%- endif -%}
  {%- endif -%}
{%- endmacro %}

# Makes sure the enabled directory exists
uwsgi_application_enabled_dir:
  file.directory:
    {{ sls_block(uwsgi.applications.dir_opts) }}
    - name: {{ uwsgi.lookup.application_enabled }}

# If enabled and available are not the same, create available
{% if uwsgi.lookup.application_enabled != uwsgi.lookup.application_available -%}
uwsgi_application_available_dir:
  file.directory:
    {{ sls_block(uwsgi.applications.dir_opts) }}
    - name: {{ uwsgi.lookup.application_available }}
{%- endif %}

# Manage the actual application files
{% for application, settings in uwsgi.applications.managed.items() %}
{% endfor %}

# Managed enabled/disabled state for applications
{% for application, settings in uwsgi.applications.managed.items() %}
{% if settings.config != None %}
{% set conf_state_id = 'application_conf_' ~ loop.index0 %}
{{ conf_state_id }}:
  file.managed:
    {{ sls_block(uwsgi.applications.managed_opts) }}
    - name: {{ application_curpath(application) }}
    - source: salt://uwsgi/files/application.jinja
    - template: jinja
    - context:
        config: {{ settings.config|json() }}
{% do application_states.append(conf_state_id) %}
{% endif %}

{% if settings.enabled != None %}
{% set status_state_id = 'application_state_' ~ loop.index0 %}
{{ status_state_id }}:
{{ manage_status(application, settings.enabled) }}
{% if settings.config != None %}
    - require:
      - file: {{ conf_state_id }}
{% endif %}

{% do application_states.append(status_state_id) %}
{% endif %}
{% endfor %}
