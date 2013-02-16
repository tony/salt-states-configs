include: 
  - salt.minion

lsb-release:
  pkg.installed:
    - watch_in: 
      - cmd: restart_minion

