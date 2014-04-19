include:
  - users


zsh:
  pkg.installed:
    - name: zsh

{% for name, user in pillar.get('users', {}).items() %}
{%- if user == None -%}
{%- set user = {} -%}
{%- endif -%}
{%- set home = user.get('home', "/home/%s" % name) -%}

{%- if 'prime_group' in user and 'name' in user['prime_group'] %}
{%- set user_group = user.prime_group.name -%}
{%- else -%}
{%- set user_group = name -%}
{%- endif %}

{%- if 'zsh' in user.get('shell') %}
{{ name }}_oh-my-zsh:
  git.latest:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - target: {{ home }}/.oh-my-zsh
    - user: {{ name }}
    - submodules: true

{{ home }}/.zshrc:
  file.copy:
    - source: {{ home }}/.oh-my-zsh/templates/zshrc.zsh-template
    - require:
        - user: {{ name }}_user
{%- endif %}

{% endfor %}
