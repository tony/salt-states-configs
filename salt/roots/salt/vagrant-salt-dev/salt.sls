git:
  pkg.installed


github:
  ssh_known_hosts.present:
    - name: github.com
    - user: {{ pillar['user'] }}
    - fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48


salt_repo:
  git.latest:
    - name: git@github.com:saltstack/salt.git
    - rev: develop
    - target: {{ pillar['salt_repo'] }}
    - user: {{ pillar['user'] }}
    - remote_name: 'upstream'
    - require:
        - pkg: git
        - ssh_known_hosts: github
