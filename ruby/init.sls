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
     - unless: rvm -v 2>/dev/null
   require:
     - pkg: rvm-deps

ruby:
  pkg.installed:
    - name: ruby1.9.1-full
