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
   cmd.run:
     - name: \curl -L https://get.rvm.io | bash -s stable --ruby
     - user: tony
     - group: tony
     - cwd: /home/tony
     #- env: HOME=/home/tony PATH=$PATH:$HOME/.rvm/bin
     #- env: PATH=$PATH:$HOME/.rvm/bin
     - unless: /home/tony/.rvm/bin/rvm -v >/dev/null
   require:
     - pkg: rvm-deps

ruby:
  pkg.installed:
    - name: ruby1.9.1-full
