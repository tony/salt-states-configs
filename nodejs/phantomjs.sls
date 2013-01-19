# based off https://github.com/saltstack/salt-states/blob/master/small/ruby-1.9.2/init.sls
# Saltstate file for phantomjs 1.8 binary

download-phantomjs:
  file.managed:
    #- name: /tmp/phantomjs-1.8.1-linux-i686.tar.bz2
    #- source: http://phantomjs.googlecode.com/files/phantomjs-1.8.1-linux-i686.tar.bz2
    #- source_hash: md5=6e834974c9c6fc8af3703ea794aa397
    - name: /tmp/phantomjs-1.8.1-linux-x86_64.tar.bz2
    - source: http://phantomjs.googlecode.com/files/phantomjs-1.8.1-linux-x86_64.tar.bz2
    - source_hash: md5=cb58475032a8853a4f222b5adbdfa43c
  cmd:
    - run
    - cwd: /tmp
    - name: wget http://phantomjs.googlecode.com/files/phantomjs-1.8.1-linux-x86_64.tar.bz2

# Extract it
extract-phantomjs:
  cmd:
    - cwd: /tmp
    - names:
      #- tar xvf /tmp/phantomjs-1.8.1-linux-i686.tar.bz2
      - tar xvf phantomjs-1.8.1-linux-x86_64.tar.bz2
    - run
    - require:
      #- file.managed: download-phantomjs
      - cmd: download-phantomjs


# Copy binary

phantomjs:
  file.managed:
    - name: /usr/local/bin/phantomjs
    - source: salt://nodejs/bin/phantomjs
    - user: root
    - group: root
    - mode: 755
    #- source: file:///tmp/phantomjs-1.8.1-linux-x86_64/bin/phantomjs
    #- require:
    #  - cmd: extract-phantomjs
