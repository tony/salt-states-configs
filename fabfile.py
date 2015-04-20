# -*- coding: utf-8 -*-
"""Example of using this with a vagrant environment::

    fab test -H 172.28.128.8 --password=vagrant --user=vagrant
"""

import os
import sys
import subprocess
from salt.modules.cmdmod import DEFAULT_SHELL

sys.path.append(os.path.dirname(__file__))
from salt_python import salt


try:
    import fabric
except ImportError:
    raise Exception("""
        You must install the latest version of salt:
        pip install fabric
    """)


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
        cmd,
        shell=shell,
        user=runas,
        timeout=timeout,
        warn_only=ignore_retcode,
        stdin=stdin,
        stdout=stdout,
        stderr=stderr,
        env=env
    )

def salt_run_fabric_quiet(cmd,
                        cwd=None,
                        stdin=None,
                        runas=None,
                        shell=DEFAULT_SHELL,
                        python_shell=True,
                        env=None,
                        template=None,
                        umask=None,
                        timeout=None,
                        reset_system_locale=True,
                        saltenv='base'):
    '''
    Helper for running commands quietly for minion startup
    '''
    return salt_run_fabric(cmd,
                runas=runas,
                cwd=cwd,
                stdin=stdin,
                stderr=subprocess.STDOUT,
                output_loglevel='quiet',
                shell=shell,
                python_shell=python_shell,
                env=env,
                template=template,
                umask=umask,
                timeout=timeout,
                reset_system_locale=reset_system_locale,
                saltenv=saltenv)['stdout']

def bootstrap_fabric():
    from salt.config import DEFAULT_MASTER_OPTS

    __builtins__['__salt__'] = {
        'cmd.run': salt_run_fabric,
        'cmd.run_all': salt.modules.cmdmod.run_all
    }

    __builtins__['__context__'] = {}
    __builtins__['__grains__'] = {}
    __builtins__['__opts__'] = DEFAULT_MASTER_OPTS
    __builtins__['__salt__'].update(
        salt.loader.minion_mods(
            __opts__
        )
    )

bootstrap_fabric()


@fabric.api.task
def test():
    fabric.api.run('echo hello')
    from salt.modules import aptpkg

    print(aptpkg.list_pkgs())
