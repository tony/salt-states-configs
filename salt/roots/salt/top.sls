base:
  '*':
    - users
    - base.sanity
    - dot-configs.base
  'roles:x11':
    - match: grain
    - base-x11.sanity
  'role:vagrant':
    - vagrant.locale
    - vagrant.python
    - vagrant.salt
    - vagrant.virtualenv
