canonical-partner-repo:
  file.sed:
    - name: /etc/apt/sources.list
    - limit: '^# deb .*partner'
    - before: '^# '
    - after: ''

canonical-partner-repo-src:
  file.sed:
    - name: /etc/apt/sources.list
    - limit: '^# deb-src .*partner'
    - before: '^# '
    - after: ''
