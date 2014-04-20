=========
Changelog
=========

Here you can find the recent changes to tony/salt-states-config.

2014-04-20
----------

- Minion configs and top.sls files now use grains to manage roles.
- Move dot-configs to roots/
- Move oh-my-zsh to dot-configs/zsh.sls
- Create minion/master config example for my laptop in minions
- Use salt-formulas for ntp https://github.com/saltstack-formulas/ntp-formula.

2014-04-19
----------

- Use salt-formulas for users https://github.com/saltstack-formulas/users-formula.
- Use salt-formulas for openssh https://github.com/saltstack-formulas/openssh-formula.
- Move salt-formula to a git submodule in roots/formulas/salt.
- Restructure salt roots for pillars and states.
- Update sysutils/* to use correct naming conventions
- Update shells/zsh to rely on new users formula

2014-04-18
----------

- Update ./databases/mysql based on https://github.com/saltstack-formulas/mysql-formula.
- Remove old ./deploy dir and states

2014-04-16
----------

- Update ./salt sls based on https://github.com/saltstack-formulas/salt-formula.
- Update ./www/uwsgi based on https://github.com/wunki/django-salted/tree/master/salt/roots/salt/uwsgi.
- Fix package names in uwsgi/supervisor


2014-04-15
----------

- Updated ``top.sls`` to give absolute path to ``editors.vim`` module
  as states within aren't automtically detected anymore. A ``init.sls``
  with ``include`` directives is required.
- Move ``mercurial.git`` (and its' alias ``hg.git``), ``git.sls`` to the
  ``./vcs/`` folder.
- For version `Version 0.16.0`_, use relative includes. Changes:

  - ``vcs/hg.sls``
- New packages

  - databases.postgresql based off saltstack-formulas/postgres-formulas

.. _Version 0.16.0: http://docs.saltstack.com/en/latest/topics/releases/0.16.0.html
