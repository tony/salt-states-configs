# Configuration file for salt-minion. Some workaround is present here:
# currently salt-minion cannot restart itself, thus it's impossible to restart
# minion after valuable changes like changing config file.

/etc/salt/minion.d:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - clean: True
    - require:
      - pkg: salt-minion

restart_minion:
  cmd.wait:
    - name: "echo 'invoke-rc.d salt-minion restart'|at now + 1 min"
    - order: last
    - watch:
      - pkg: salt-minion
      - file: /etc/salt/minion
      - file: /etc/salt/minion.d
    - require:
      - pkg: at

salt-minion:
  service:
    - running
    - enable: True
  pkg.installed:
    - names:
      - salt-minion
      - at
  file.managed:
    - name: /etc/salt/minion
    - owner: root
    - group: root
    - mode: 0644
    - source: salt://salt/minion/config.template
    - template: jinja
    - context:
      master: salt
      file_roots:
        base:
          - /srv/salt/private
          - /srv/salt/base
      pillar_roots:
        base:
          - /srv/salt/private/pillar
          - /srv/salt/base/pillar
