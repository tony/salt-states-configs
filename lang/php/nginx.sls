include:
  - lang.php
  - www.nginx

extend:
  php:
    pkg:
      - require:
        - service: nginx
