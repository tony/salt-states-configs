# uwsgi.vassal_config
#
# Manages the configuration of uwsgi vassal files.

{% from 'uwsgi/map.jinja' import uwsgi, sls_block with context %}
{% set vassal_states = [] %}

# Simple path concatenation.
# Needs work to make this function on windows.
{% macro path_join(file, root) -%}
  {{ root ~ '/' ~ file }}
{%- endmacro %}

# Retrieves the disabled name of a particular vassal
{% macro disabled_name(vassal) -%}
  {%- if uwsgi.lookup.vassal_use_symlink -%}
    {{ uwsgi.vassals.managed.get(vassal).get('disabled_name', vassal) }}
  {%- else -%}
    {{ uwsgi.vassals.managed.get(vassal).get('disabled_name', vassal ~ uwsgi.vassals.disabled_postfix) }}
  {%- endif -%}
{%- endmacro %}

# Gets the path of a particular vassal
{% macro vassal_path(vassal, state) -%}
  {%- if state == True -%}
    {{ path_join(vassal, uwsgi.vassals.managed.get(vassal).get('dir', uwsgi.lookup.vassal_enabled)) }}
  {%- elif state == False -%}
    {{ path_join(disabled_name(vassal), uwsgi.vassals.managed.get(vassal).get('dir', uwsgi.lookup.vassal_available)) }}
  {%- else -%}
    {{ path_join(vassal, uwsgi.vassals.managed.get(vassal).get('dir', uwsgi.lookup.vassal_available)) }}
  {%- endif -%}
{%- endmacro %}

# Gets the current canonical name of a vassal
{% macro vassal_curpath(vassal) -%}
  {{ vassal_path(vassal, uwsgi.vassals.managed.get(vassal).get('available')) }}
{%- endmacro %}

# Creates the sls block that manages symlinking / renaming vassals
{% macro manage_status(vassal, state) -%}
  {%- set anti_state = {True:False, False:True}.get(state) -%}
  {% if state == True %}
    {%- if uwsgi.lookup.vassal_use_symlink %}
  file.symlink:
    {{ sls_block(uwsgi.vassals.symlink_opts) }}
    - name: {{ vassal_path(vassal, state) }}
    - target: {{ vassal_path(vassal, anti_state) }}
    {%- else %}
  file.rename:
    {{ sls_block(uwsgi.vassals.rename_opts) }}
    - name: {{ vassal_path(vassal, state) }}
    - source: {{ vassal_path(vassal, anti_state) }}
    {%- endif %}
  {%- elif state == False %}
    {%- if uwsgi.lookup.vassal_use_symlink %}
  file.absent:
    - name: {{ vassal_path(vassal, anti_state) }}
    {%- else %}
  file.rename:
    {{ sls_block(uwsgi.vassals.rename_opts) }}
    - name: {{ vassal_path(vassal, state) }}
    - source: {{ vassal_path(vassal, anti_state) }}
    {%- endif -%}
  {%- endif -%}
{%- endmacro %}

# Makes sure the enabled directory exists
uwsgi_vassal_enabled_dir:
  file.directory:
    {{ sls_block(uwsgi.vassals.dir_opts) }}
    - name: {{ uwsgi.lookup.vassal_enabled }}

# If enabled and available are not the same, create available
{% if uwsgi.lookup.vassal_enabled != uwsgi.lookup.vassal_available -%}
uwsgi_vassal_available_dir:
  file.directory:
    {{ sls_block(uwsgi.vassals.dir_opts) }}
    - name: {{ uwsgi.lookup.vassal_available }}
{%- endif %}

# Manage the actual vassal files
{% for vassal, settings in uwsgi.vassals.managed.items() %}
{% endfor %}

# Managed enabled/disabled state for vassals
{% for vassal, settings in uwsgi.vassals.managed.items() %}
{% if settings.config != None %}
{% set conf_state_id = 'vassal_conf_' ~ loop.index0 %}
{{ conf_state_id }}:
  file.managed:
    {{ sls_block(uwsgi.vassals.managed_opts) }}
    - name: {{ vassal_curpath(vassal) }}
    - source: salt://uwsgi/emperor/files/vassal.jinja
    - template: jinja
    - context:
        config: {{ settings.config|json() }}
{% do vassal_states.append(conf_state_id) %}
{% endif %}

{% if settings.enabled != None %}
{% set status_state_id = 'vassal_state_' ~ loop.index0 %}
{{ status_state_id }}:
{{ manage_status(vassal, settings.enabled) }}
{% if settings.config != None %}
    - require:
      - file: {{ conf_state_id }}
{% endif %}

{% do vassal_states.append(status_state_id) %}
{% endif %}
{% endfor %}
