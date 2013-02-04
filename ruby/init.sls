rvm-deps:
  pkg.installed:
    - names:
      - libxslt1.1
      - libxslt1-dev
      - xvfb
      - build-essential
      - git-core
      - curl

rvm:
   cmd.wait:
     - name: \curl -L https://get.rvm.io | bash -s stable --ruby
     - user: {{ pillar['username'] }}
     - group: {{ pillar['username'] }}
     - cwd: /home/{{ pillar['username'] }}
     #- env: HOME=/home/{{ pillar['username'] }} PATH=$PATH:$HOME/.rvm/bin
     #- env: PATH=$PATH:$HOME/.rvm/bin
     - unless: /home/{{ pillar['username'] }}/.rvm/bin/rvm -v >/dev/null
   require:
     - pkg: rvm-deps

ruby:
  pkg.installed:
    - name: ruby1.9.1-full
