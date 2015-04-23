# https://github.com/saltstack-formulas/salt-formula
salt:
  master:
    fileserver_backend:
      - roots
    file_roots:
      base:
        - /home/tony/workspace/salt-states-configs/roots/salt
        - /home/tony/workspace/salt-states-configs/roots/formulas/users
        - /home/tony/workspace/salt-states-configs/roots/formulas/openssh
        - /home/tony/workspace/salt-states-configs/roots/formulas/salt
        - /home/tony/workspace/salt-states-private
    pillar_roots:
      base:
        - /home/tony/workspace/salt-states-configs/roots/pillar
        - /home/tony/workspace/salt-states-private/pillar
  minion:
    master: salt
    file_roots:
      base:
        - /home/tony/workspace/salt-states-configs/roots/salt
        - /home/tony/workspace/salt-states-configs/roots/formulas/users
        - /home/tony/workspace/salt-states-configs/roots/formulas/openssh
        - /home/tony/workspace/salt-states-configs/roots/formulas/salt
        - /home/tony/workspace/salt-states-private
    pillar_roots:
      base:
        - /home/tony/workspace/salt-states-configs/roots/pillar
        - /home/tony/workspace/salt-states-private/pillar
