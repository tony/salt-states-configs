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
* Support for testing states via `vagrant`_
  
.. _vagrant: https://www.vagrantup.com/

Structure
---------

Originally based off https://github.com/python/pypi-salt.

``salt/roots/`` is for anything that would be in ``file_roots`` or
``pillar_roots``.

- ./salt/roots/pillar - pillar data
- ./salt/roots/dot-configs - dot-config sls states
- ./salt/roots/salt - package sls states

Setup
-----

Clone the data recursively (include submodules):

.. code:: bash

   git clone https://github.com/tony/salt-states-configs.git /srv/salt/salt-states-tony

Add the necessary ``file_roots`` and ``pillar_roots`` to your project.

``/etc/salt/master``:

.. code:: yaml

    pillar_roots:
        base:
            - /srv/salt/salt-states-tony/salt/roots/pillar

    file_roots:
        base:
            - /srv/salt/salt-states-tony/salt/roots/salt

Note: to see an updated, full list of formulas / roots see the
`minions/master`_ example file.

Restart the salt master.

.. code:: bash

    $ [sudo] /etc/init.d/salt-master restart

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
