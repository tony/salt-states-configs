# based off https://github.com/saltstack/salt-states/blob/master/small/ruby-1.9.2/init.sls
# Saltstate file for phantomjs 1.8 binary

phantomjs-1.8:
  file.managed:
    - name: /tmp/phantomjs-1.8.1-linux-i686.tar.bz2
    #- source: http://phantomjs.googlecode.com/files/phantomjs-1.8.1-linux-i686.tar.bz2
    - source: http://phantomjs.googlecode.com/files/phantomjs-1.8.1-linux-x86_64.tar.bz2
    - source_hash: md5=6e834974c9c6fc8af3703ea794aa397

# Extract it
extract-phantomjs:
  cmd:
    - cmd: /tmp
    - names:
      #- tar xvf /tmp/phantomjs-1.8.1-linux-i686.tar.bz2
      - tar xvf /tmp/phantomjs-1.8.1-linux-x86_64.tar.bz2
    - run
    - require:
      - file: phantomjs-1.8


# Copy binary

copy-phantomjs:
  file.managed:
    - name: /usr/local/bin/phantomjs
    - source: /tmp/phantomjs-1.8.1-linux-x86_64/bin/phantomjs
    - user: root
    - group: root
    - mode: 755
    - require:
      - cmd: extract-phantomjs
