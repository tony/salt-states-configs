include:
  - vcs.git

awesome:
    pkg:
      - installed
    require:
      - pkg.installed:
        - names:
          - feh
