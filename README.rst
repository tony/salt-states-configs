saltstack config files
======================

Former: Configure a ubuntu 12.10 development environment with salt `v0.14.0`_.

Ongoing: Transitioning to debian 8.0 (jessie / testing) with release
`2014.1.1`_.

See the `CHANGES.rst`_ file.

.. _2014.1.1: http://docs.saltstack.com/en/latest/topics/releases/2014.1.1.html
.. _v0.14.0: http://docs.saltstack.com/en/latest/topics/releases/0.14.0.html

.. _CHANGES.rst: https://github.com/tony/salt-states-configs/blob/master/CHANGES.rst


Features
--------

* Support for dot-configurations
* Support for provisining minions

Why is the structure like this?
-------------------------------

based off https://github.com/python/pypi-salt.

``roots/`` is for anything that would be in ``file_roots`` or
``pillar_roots``.

Also, formulas are included (at a locked version / ref) in
``roots/formulas``. These must be added into ``file_roots`` individually.

- ./roots/pillar - pillar data
- ./roots/dot-configs - dot-config sls states
- ./roots/salt - package sls states
- ./roots/formulas - package sls from `saltstack-formulas`_ repository.

.. _saltstack-formulas: https://github.com/saltstack-formulas

Dependency Formulae
-------------------

These are already part of this project as a submodule, but you may also
include them in your root as ``gitfs_remotes``.

For more information, see `Salt Formulas documentation`_.

- https://github.com/saltstack-formulas/users-formula
- https://github.com/saltstack-formulas/openssh-formula

.. _Salt Formulas documentation: http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html

Setup
-----

Clone the data recursively (include submodules):

.. code:: bash

   git clone --recursive https://github.com/tony/salt-states-configs.git /srv/salt/salt-states-tony

Add the necessary ``file_roots`` and ``pillar_roots`` to your project.

``/etc/salt/master``:

.. code:: yaml

    pillar_roots:
        base:
            - /srv/salt/salt-states-tony/roots/pillar

    file_roots:
        base:
            - /srv/salt/salt-states-tony/roots/salt
            - /srv/salt/salt-states-tony/roots/dot-configs
            - /srv/salt/salt-states-tony/roots/formulas/users
            - /srv/salt/salt-states-tony/roots/formulas/openssh
            - /srv/salt/salt-states-tony/roots/formulas/salt
            - /srv/salt/salt-states-tony/roots/formulas/ntp

Note: to see an updated, full list of formulas / roots see the
`minions/master`_ example file.

Restart the salt master.

.. code:: bash

    $ [sudo] /etc/init.d/salt-master restart

Customize your pillar data in ``roots/pillar`` from the ``.example``
files.

.. _minions/master: https://github.com/tony/salt-states-configs/blob/master/minions/master

How to bootstrap a minion with config
-------------------------------------

See http://docs.saltstack.com/en/latest/topics/cloud/config.html#saltify.

Borrows from
------------

- https://github.com/bclermont/states
- https://github.com/rentalita/ubuntu-setup - medibuntu, some nginx
- https://github.com/jollyroger/salt-states/blob/master/vim/init.sls
- set vim_bin variable, update alternatives. mysql state.
- ports structure:
  http://ftp.netbsd.org/pub/pkgsrc/current/pkgsrc/README.html
- Xdefaults colors from thayer,
  https://bbs.archlinux.org/viewtopic.php?pid=652524#p652524
- uwsgi https://github.com/wunki/django-salted/tree/master/salt/roots/salt/uwsgi
- structure: https://github.com/python/pypi-salt
