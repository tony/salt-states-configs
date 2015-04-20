{% set home = pillar['home'] %}
{% set user = pillar['user'] %}

include:
  - python
  - salt


swig:
  pkg.installed


libssl-dev:
  pkg.installed


virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip


base_virtualenv:
  virtualenv.managed:
    - name: {{ home }}/env/
    - user: {{ user }}
    - no_chown: True
    - cwd: {{ home }}
    - system_site_packages: False
    - requirements: {{ pillar['salt_repo'] }}/requirements/zeromq.txt
    - require:
      - pip: virtualenv
      - git: salt_repo
      - pkg: swig
      - pkg: libssl-dev


psutil:
  pip.installed:
    - name: psutil
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - require:
      - virtualenv: base_virtualenv


salt_pip:
  pip.installed:
    - name: {{ pillar['salt_repo'] }}
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - editable: {{ pillar['salt_repo'] }}
    - require:
      - virtualenv: base_virtualenv


salt_minion:
  file.managed:
    - name: {{ home }}/env/etc/salt/minion
    - source: salt://minion
    - user: {{ pillar['user'] }}
    - group: {{ pillar['user'] }}
    - mode: 644
    - makedirs: True
    - require:
      - virtualenv: base_virtualenv


salt_master:
  file.managed:
    - name: {{ home }}/env/etc/salt/master
    - source: salt://master
    - user: {{ pillar['user'] }}
    - group: {{ pillar['user'] }}
    - mode: 644
    - makedirs: True
    - require:
      - virtualenv: base_virtualenv
