#!/usr/bin/env python
"""
Mission
-------

This is a work-around to bolt saltstack modules and states into any python code.

Saltstack is a permissively-licensed, pythonic configuration management system.
Fabric is a task-runner for all sorts of miscellaneous configurations. Both are
essential tools.

You can read the documentation for the commands at:

- http://docs.saltstack.com/en/latest/ref/states/all/
- http://docs.saltstack.com/en/latest/ref/modules/all/

Growing big
-----------

If you think that your fabric file is getting too bit, or your needs get
too complicated, you can migrate your project to a salt's declarative YAML
syntax, cloud provisioning and more.

You can begin to move over using a crawl-walk-run approach. First, start
creating some initial `salt states`_ in YAML.

You can start by installing to your local machine and using ``salt-ssh`` to
setup servers. This is `Roster`_\ -based configuration.

If you are beginning to manage large clusters of servers, it makes sense to
start controlling your system via a `Salt Master`_.

.. _Roster: http://docs.saltstack.com/en/latest/topics/ssh/roster.html
.. _salt states: http://docs.saltstack.com/en/latest/topics/tutorials/starting_states.html
.. _Salt Master: http://docs.saltstack.com/en/latest/topics/tutorials/walkthrough.html#setting-up-the-salt-master


Copyright 2015, Tony Narlock (tony@git-pull.com). Licensed MIT.

Fabric is MIT, https://github.com/fabric/fabric/blob/master/LICENSE
SaltStack is Apache 2: https://github.com/saltstack/salt/blob/develop/LICENSE
"""

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
    from salt.config import DEFAULT_MASTER_OPTS

    import salt.log.setup
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

def salt_run_fabric(cmd,
                    cwd=None,
                    stdin=None,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                    output_loglevel='debug',
                    quiet=False,
                    runas=None,
                    shell=DEFAULT_SHELL,
                    python_shell=True,
                    env=None,
                    clean_env=False,
                    rstrip=True,
                    template=None,
                    umask=None,
                    timeout=None,
                    with_communicate=True,
                    reset_system_locale=True,
                    ignore_retcode=False,
                    saltenv='base',
                    use_vt=False):

    """Adapter to fit salt's argument signature into into fabric's
    subprocess wrapper."""

    return fabric.operations.sudo(

    )



def bootstrap_fabric():
    from salt.config import DEFAULT_MASTER_OPTS
    from salt.modules.cmdmod import DEFAULT_SHELL

    try:
        import fabric
    except ImportError:
        raise Exception("""
            You must install the latest version of salt:
            pip install fabric
        """)

    __builtins__.__salt__ = {
        'cmd.run': salt_run_fabric,
        'cmd.run_all': salt.modules.cmdmod.run_all
    }

    __builtins__.__grains__ = {}
    __builtins__.__opts__ = DEFAULT_MASTER_OPTS
    __builtins__.__salt__.update(
        salt.loader.minion_mods(
            __opts__
        )
    )


def git_clone_salt():

    from salt.modules import git

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
