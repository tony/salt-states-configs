minitube:
    pkgrepo.managed:
      - ppa: nilarimogard/webupd8
    pkg.installed:
      - require:
        - pkgrepo: minitube
