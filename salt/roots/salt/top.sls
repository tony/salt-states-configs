base:
  '*':
    - users
    - base.sanity
    - dot-configs.base
  'roles:x11':
    - match: grain
    - base-x11.sanity
  'role:vagrant':
    - vagrant-salt-dev.locale
    - vagrant-salt-dev.python
    - vagrant-salt-dev.salt
    - vagrant-salt-dev.virtualenv
