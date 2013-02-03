saltstack config files
======================

For demonstration.

Features
--------

* vim (my vim config at http://github.com/tony/vim-config)
* awesome (my awesome config http://github.com/awesome-config)
* rxvt-unicode - custom ``Xdefaults`` w/ support for chinese characaters and
  ibus for pinyin.
* pixel fonts, unicode fonts

Setup
-----

.. code:: bash

   git clone https://github.com/tony/salt-states-configs.git /srv/salt/base


``/etc/salt/master``:

.. code:: yaml

    pillar_roots:
    base:
        - /srv/salt/base/pillar
        - /srv/salt/private/pillar

    file_roots:
    base:
        - /srv/salt/base
        - /srv/salt/private

There may not be a need to follow the structure above, but I do it to
separate private from contrib salt states.

Copy ``pillar/settings.sls.example`` to ``pillar/settings.sls`` and edit
`username` and `fullname`.  The study directive is not used as of
2013-02-03 and may be removed.

To do
-----

- use ports directory structure to manage apps
- separate configs from apps
- separate daemons from apps
- separate daemons, from text, from curses, from x11 apps

Borrows from
------------

* https://github.com/bclermont/states
