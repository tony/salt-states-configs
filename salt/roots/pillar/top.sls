base:
  '*':
    - paths

  'role:vagrant':
    - match: grain
    - vagrant

  'role:travis':
    - match: grain
    - travis
