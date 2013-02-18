include:
  - python.python-libs

python-m2crypto:
  pkg:
    - installed
  require:
    - pkg: python2

salt-dev-packages:
  pip.installed:
    - names:
        - pyzmq
        - PyYAML
        - pycrypto
        - msgpack-python
        - jinja2
        - psutil


# do pip install -e ./salt
# do the path with the salt git clone is

/home/{{ pillar['username'] }}/.virtualenvs/salt:
  virtualenv.managed:
    - no_site_packages: True
    - system_site_packages: True
    - runas: {{ pillar['username'] }}
    - requirements: salt://salt/dev/requirements.txt
    - template: jinja
  pip.installed:
    - name: /home/{{ pillar['username'] }}/study/python/salt
    - editable: file:///home/{{ pillar['username'] }}/study/python/salt
    # temporarily, https://github.com/saltstack/salt/issues/3751
    #- editable: True # equivalent to python -e
    - user: {{ pillar['username'] }}
    - bin_env: /home/{{ pillar['username'] }}/.virtualenvs/salt/bin/pip
    - require:
      - virtualenv.managed: /home/{{ pillar['username'] }}/.virtualenvs/salt
