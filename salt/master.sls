salt-master:
  pkg:
    - latest
    - name: salt-master
  #service.running:
  #  - require:
  #    - file: /etc/salt/minion
  #    - pkg: salt
  #  - names:
  #   - salt-master
  #   - salt-minion
  #  - watch:
  #    - file: /etc/salt/minion

/etc/salt/master:
  file.managed:
    - source: salt://salt/master
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: salt
