saltstack config files
======================

Configure a ubuntu 12.10 development environment with salt.

For demonstration. Setting up a laptop / server / work env in pure
saltstack states.

Features
--------

* vim (my vim config at http://github.com/tony/vim-config)
* awesome (my awesome config http://github.com/awesome-config)
* rxvt-unicode - custom ``Xdefaults`` w/ support for chinese characater
  and ibus for pinyin.
* pixel fonts, unicode fonts
* my personal configuratinos are found in `tony` state, if you follow
  you may refer to this when creating states to copy your own configs
  over.

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

- use ports hierarchy to organize apps [in-progress]
- separate configs from apps [done]
- separate daemons, from text, from curses, from x11 apps [in-progress]
- wire in study.python.salt for salt.dev pillar
- use pillars to allow users to download their awesome, vim, etc configs
  from vcs's like git

Salt core TODO ideas
--------------------

- git.state to add remotes to git repos
- jinja template support for requirements.txt on pip/virtualenv
- enhanced pip.installed editable support
  https://github.com/saltstack/salt/issues/3751

Borrows from
------------

- https://github.com/bclermont/states
- https://github.com/rentalita/ubuntu-setup - medibuntu, some nginx
- https://github.com/jollyroger/salt-states/blob/master/vim/init.sls -
  vim: vim_bin variable, update alternatives. mysql state.
- ports structure:
  http://ftp.netbsd.org/pub/pkgsrc/current/pkgsrc/README.html
- Xdefaults colors from thayer,
  https://bbs.archlinux.org/viewtopic.php?pid=652524#p652524
