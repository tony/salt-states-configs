include:
  - apt

skype:
  pkg:
    - installed
    - require:
      - file: canonical-partner-repo
      - file: canonical-partner-repo-src
