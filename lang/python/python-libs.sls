python-software-properties:
  pkg.installed

#python-virtualenv:
  #  pkg.installed:
    #    - name: python-virtualenv
    #  require:
      #    - pkg: python2.7

python2:
  pkg.installed:
    - names:
      - python2.7
      - python-dev
      - python-pip


virtualenv:
  pip:
    - installed
  require:
    - pkg.installed: python2

virtualenvwrapper:
  pip:
    - installed
    - require:
      - pip.installed: virtualenv
