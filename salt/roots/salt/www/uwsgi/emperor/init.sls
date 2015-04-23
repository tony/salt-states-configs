# uwsgi.emperor
#
# Meta-state to install uwsgi emperor

include:
  - .config
  - .service
  - .vassals

extend:
  uwsgi_emperor_service:
    service:
      - watch:
        - file: uwsgi_emperor_config
      - require:
        - file: uwsgi_emperor_config
  uwsgi_emperor_config:
    file:
      - require:
        - pkg: uwsgi_emperor_install
