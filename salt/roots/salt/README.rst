Salt formulas
-------------

Made for Ubuntu 12.04 originally, but moving to debian 8 / jessie
packages.

``base/`` and ``base/x11`` are for bootstrapping common suites of tools on
salt servers. ``top.sls`` will include them based on whether it's a
headless / windowless server (CLI-only) or a laptop/desktop using x11.
