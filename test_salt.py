#!/usr/bin/env python

import os
import logging

import salt.log.setup
salt.log.setup.setup_temp_logger(log_level='debug')

try:
    import salt
except ImportError:
    raise Exception("""
        You must install the latest version of salt:
        curl -L https://bootstrap.saltstack.com -o install_salt.sh
        sudo sh install_salt.sh git develop
    """)


import salt.loader
"""Temporary __builtins__ workaround until saltstack is refactored to handle
importing modules pythonically."""
# global salt functions
__builtins__.__salt__ = {
    'cmd.run': salt.modules.cmdmod._run_quiet,
    'cmd.run_all': salt.modules.cmdmod.run_all
}


# settings / system specs for whatever system command is being ran on
__builtins__.__grains__ = {}
# options
from salt.config import DEFAULT_MASTER_OPTS
__builtins__.__opts__ = DEFAULT_MASTER_OPTS

__builtins__.__salt__.update(
    salt.loader.minion_mods(
        __opts__
    )
)

# Solve the Chicken and egg problem where grains need to run before any
# of the modules are loaded and are generally available for any usage.
import salt.modules.cmdmod
from salt.modules import git

class Task(object):
    """
    Abstract base class for objects wishing to be picked up as Fabric tasks.
    Instances of subclasses will be treated as valid tasks when present in
    fabfiles loaded by the :doc:`fab </usage/fab>` tool.
    For details on how to implement and use `~fabric.tasks.Task` subclasses,
    please see the usage documentation on :ref:`new-style tasks
    <new-style-tasks>`.
    .. versionadded:: 1.1
    """
    name = 'undefined'
    use_task_objects = True
    aliases = None
    is_default = False

    # TODO: make it so that this wraps other decorators as expected
    def __init__(self, alias=None, aliases=None, default=False, name=None,
        *args, **kwargs):
        if alias is not None:
            self.aliases = [alias, ]
        if aliases is not None:
            self.aliases = aliases
        if name is not None:
            self.name = name
        self.is_default = default

    def __details__(self):
        return get_task_details(self.run)

    def run(self):
        raise NotImplementedError

    def get_hosts_and_effective_roles(self, arg_hosts, arg_roles, arg_exclude_hosts, env=None):
        """
        Return a tuple containing the host list the given task should be using
        and the roles being used.
        See :ref:`host-lists` for detailed documentation on how host lists are
        set.
        .. versionchanged:: 1.9
        """
        env = env or {'hosts': [], 'roles': [], 'exclude_hosts': []}
        roledefs = env.get('roledefs', {})
        # Command line per-task takes precedence over anything else.
        if arg_hosts or arg_roles:
            return merge(arg_hosts, arg_roles, arg_exclude_hosts, roledefs), arg_roles
        # Decorator-specific hosts/roles go next
        func_hosts = getattr(self, 'hosts', [])
        func_roles = getattr(self, 'roles', [])
        if func_hosts or func_roles:
            return merge(func_hosts, func_roles, arg_exclude_hosts, roledefs), func_roles
        # Finally, the env is checked (which might contain globally set lists
        # from the CLI or from module-level code). This will be the empty list
        # if these have not been set -- which is fine, this method should
        # return an empty list if no hosts have been set anywhere.
        env_vars = map(_get_list(env), "hosts roles exclude_hosts".split())
        env_vars.append(roledefs)
        return merge(*env_vars), env.get('roles', [])

    def get_pool_size(self, hosts, default):
        # Default parallel pool size (calculate per-task in case variables
        # change)
        default_pool_size = default or len(hosts)
        # Allow per-task override
        # Also cast to int in case somebody gave a string
        from_task = getattr(self, 'pool_size', None)
        pool_size = int(from_task or default_pool_size)
        # But ensure it's never larger than the number of hosts
        pool_size = min((pool_size, len(hosts)))
        # Inform user of final pool size for this task
        if state.output.debug:
            print("Parallel tasks now using pool size of %d" % pool_size)
        return pool_size


class WrappedCallableTask(Task):
    """
    Wraps a given callable transparently, while marking it as a valid Task.
    Generally used via `~fabric.decorators.task` and not directly.
    .. versionadded:: 1.1
    .. seealso:: `~fabric.docs.unwrap_tasks`, `~fabric.decorators.task`
    """
    def __init__(self, callable, *args, **kwargs):
        super(WrappedCallableTask, self).__init__(*args, **kwargs)
        self.wrapped = callable
        # Don't use getattr() here -- we want to avoid touching self.name
        # entirely so the superclass' value remains default.
        if hasattr(callable, '__name__'):
            if self.name == 'undefined':
                self.__name__ = self.name = callable.__name__
            else:
                self.__name__ = self.name
        if hasattr(callable, '__doc__'):
            self.__doc__ = callable.__doc__
        if hasattr(callable, '__module__'):
            self.__module__ = callable.__module__

    def __call__(self, *args, **kwargs):
        return self.run(*args, **kwargs)

    def run(self, *args, **kwargs):
        return self.wrapped(*args, **kwargs)

    def __getattr__(self, k):
        return getattr(self.wrapped, k)

    def __details__(self):
        orig = self
        while 'wrapped' in orig.__dict__:
            orig = orig.__dict__.get('wrapped')
        return get_task_details(orig)

def task(*args, **kwargs):
    """
    Decorator declaring the wrapped function to be a new-style task.
    May be invoked as a simple, argument-less decorator (i.e. ``@task``) or
    with arguments customizing its behavior (e.g. ``@task(alias='myalias')``).
    Please see the :ref:`new-style task <task-decorator>` documentation for
    details on how to use this decorator.
    .. versionchanged:: 1.2
        Added the ``alias``, ``aliases``, ``task_class`` and ``default``
        keyword arguments. See :ref:`task-decorator-arguments` for details.
    .. versionchanged:: 1.5
        Added the ``name`` keyword argument.
    .. seealso:: `~fabric.docs.unwrap_tasks`, `~fabric.tasks.WrappedCallableTask`
    """
    invoked = bool(not args or kwargs)
    task_class = kwargs.pop("task_class", WrappedCallableTask)
    if not invoked:
        func, args = args[0], ()

    def wrapper(func):
        return task_class(func, *args, **kwargs)

    return wrapper if invoked else wrapper(func)

@task
def git_clone_salt():
    git.clone(
        cwd='/home/tony/study/salt/_salt',
        repository='https://github.com/saltstack/salt',
    )

@task
def latest_salt():

    from salt.states import git

    return git.latest(
        target='/home/tony/study/salt/_salt2',
        name='https://github.com/saltstack/salt',
    )

if __name__ == '__main__':
    print(latest_salt())
