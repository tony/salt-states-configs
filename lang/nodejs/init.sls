nodejs_ppa:
  pkgrepo.managed:
    - ppa: chris-lea/node.js
    - require_in:
      - pkg: nodejs


nodejs:
  pkg.installed:
    - name: nodejs

