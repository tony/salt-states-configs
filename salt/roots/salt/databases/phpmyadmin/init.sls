include:
  - webserver
  - www.nginx
  - lang.php

phpmyadmin:
  pkg.installed:
    - name: phpmyadmin

phpmyadmin_nginx:
  file.managed:
    - source: salt://databases/phpmyadmin/etc/nginx/sites-available/phpmyadmin.conf
    - name: {{ pillar['etc_dir'] }}nginx/sites-available/phpmyadmin.conf
    - user: root
    - group: root
    - template: jinja
    - mode: 644
  host.present:
    - name: phpmyadmin
    - ip: 127.0.0.1

phpmyadmin_nginx-enable:
  file.symlink:
    - name: {{ pillar['etc_dir'] }}nginx/sites-enabled/phpmyadmin.conf
    - target: {{ pillar['etc_dir'] }}nginx/sites-available/phpmyadmin.conf
    - require:
      - file: phpmyadmin_nginx
