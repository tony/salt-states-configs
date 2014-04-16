=========
Changelog
=========

Here you can find the recent changes to tony/salt-states-config.


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
- Fix package names in uwsgi/supervisor

.. _Version 0.16.0: http://docs.saltstack.com/en/latest/topics/releases/0.16.0.html
