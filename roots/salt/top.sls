base:
  '*':
    - users
    - base.sanity
    - dot-configs.base
  'roles:x11':
    - match: grain
    - base-x11.sanity
