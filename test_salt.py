#!/usr/bin/env python
"""
Mission
-------

This is a work-around to bolt saltstack modules and states into any python code.

Saltstack is a permissively-licensed, pythonic configuration management system.
Fabric is a task-runner for all sorts of miscellaneous configurations. Both are
essential tools.

This tool will bootstrap saltstack so it can seemlessly run local python
modules. For task management such as fabric, this should work adequately to
fit the small gap of a tiny project, up until you need to expand to using a
full, declarative salt configuration to manage your deployment and
infrastructure.

You can read the documentation for the commands at:

- http://docs.saltstack.com/en/latest/ref/states/all/
- http://docs.saltstack.com/en/latest/ref/modules/all/


Copyright 2015, Tony Narlock (tony@git-pull.com). Licensed MIT.

Fabric is MIT, https://github.com/fabric/fabric/blob/master/LICENSE
SaltStack is Apache 2: https://github.com/saltstack/salt/blob/develop/LICENSE
"""
import os
import logging

try:
    import salt
except ImportError:
    raise Exception("""
        You must install the latest version of salt:
        curl -L https://bootstrap.saltstack.com -o install_salt.sh
        sudo sh install_salt.sh git develop
    """)


def bootstrap_python():
    """
    Temporary __builtins__ workaround until saltstack is refactored to handle
    importing modules pythonically.
    """

    import salt.log.setup
    from salt.config import DEFAULT_MASTER_OPTS
    salt.log.setup.setup_temp_logger(log_level='debug')

    __builtins__.__salt__ = {
        'cmd.run': salt.modules.cmdmod._run_quiet,
        'cmd.run_all': salt.modules.cmdmod.run_all
    }

    __builtins__.__grains__ = {}
    __builtins__.__opts__ = DEFAULT_MASTER_OPTS
    __builtins__.__salt__.update(
        salt.loader.minion_mods(
            __opts__
        )
    )

from salt.modules import git

def git_clone_salt():

    git.clone(
        cwd='/home/tony/study/salt/_salt',
        repository='https://github.com/saltstack/salt',
    )

def latest_salt():

    import salt.states.git

    return salt.states.git.latest(
        target='/home/tony/study/salt/_salt2',
        name='https://github.com/saltstack/salt',
    )

if __name__ == '__main__':
    bootstrap_python()
    print(latest_salt())
