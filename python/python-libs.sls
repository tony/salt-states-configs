python-software-properties:
  pkg.installed

python-virtualenv:
  pkg.installed:
    - name: python-virtualenv
  require:
    - pkg: python2.7

python2:
  pkg.installed:
    - names:
      - python2.7


virtualenvwrapper:
  pip.installed:
    - version: 3.6
  require:
    - pkg.installed:
      - name: python2
