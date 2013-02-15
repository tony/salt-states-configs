include:
  - vcs.git

vim-deps:
   pkg.installed:
     - names:
       - exuberant-ctags
     - require_in:
       - pkg: vim

vim-config:
   git.latest:
     - name: git://github.com/tony/vim-config.git
     - runas: {{ pillar['username'] }}
     - target: /home/{{ pillar['username'] }}/.vim
     - submodules: true
     - require:
       - pkg: git

{% set vim_pkg = pillar["vim"]|d("vim-nox") %}
{% set vim_bin = "/usr/bin/" + vim_pkg|replace("-", ".") %}
vim:
  require:
      - pkg: vim-deps
  pkg.installed:
    - name: {{ vim_pkg }}

/home/{{ pillar['username'] }}/.vimrc:
  file.symlink:
    - target: /home/{{ pillar['username'] }}/.vim/.vimrc

vim_alternatives:
  cmd.wait:
    - names:
      - update-alternatives --set editor {{ vim_bin }}
      - update-alternatives --set vim {{ vim_bin }}
      - update-alternatives --set vimdiff {{ vim_bin }}
    - require:
      - pkg: {{ vim_pkg }}
    - watch:
      - pkg: {{ vim_pkg }}
