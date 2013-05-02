include:
  - {{ pillar['username'] }}  
  
zshgit:
  git.latest:
    - name: git://github.com/robbyrussell/oh-my-zsh.git
    - target: /home/{{ pillar['username'] }}/.oh-my-zsh
    - force: true
    - runas: {{ pillar['username'] }}
    - submodules: true


zsh:
  pkg.installed

/home/{{ pillar['username'] }}/.zshrc:
  file.managed:
    - source: /home/{{ pillar['username'] }}/.oh-my-zsh/templates/zshrc.zsh-template
    - require:
        - user: {{ pillar['username'] }}
    - force: True
