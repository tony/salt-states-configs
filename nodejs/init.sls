include:
  - python.python-libs

nodejs:
   cmd.run:
    - name: /usr/bin/add-apt-repository -y ppa:chris-lea/node.js
    - require:
      - pkg: python-software-properties
   pkg:
    - installed
    - refresh: True
    - names:
      - nodejs
      - npm
    - require:
      - cmd: nodejs
