base:
  '*':
    - users
  'role:x11':
    - match: grain
    - base-x11.sanity
  'role:vagrant':
    - vagrant-salt-dev
