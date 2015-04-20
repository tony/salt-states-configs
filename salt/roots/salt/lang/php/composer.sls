include:
  - lang.php

php-composer:
  cmd.run:
    - name: curl -s https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
    - unless: composer -v 2>/dev/null
    - require:
      - pkg: php
