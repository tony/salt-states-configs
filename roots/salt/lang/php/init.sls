php:
  pkg:
    - latest
    - names:
      - php5-fpm
      - php5-cli
      - php5-mysql
      - php5-gd
      - php5-curl
  service:
    - name: php5-fpm
    - running
    - enable: True
    - reload: True
    - watch:
      - file: {{ pillar['etc_dir'] }}php5/fpm/*
      - file: {{ pillar['etc_dir'] }}php5/fpm/pool.d/*

/etc/php5/fpm/php.ini:
  file:
    - managed
    - source: salt://lang/php/etc/php5/fpm/php.fpm.ini
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: php


/etc/php5/fpm/pool.d/www.conf:
  file:
    - managed
    - source: salt://lang/php/etc/php5/fpm/pool.d/www.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: php
