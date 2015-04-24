# uwsgi
# 
# Meta state to install uwsgi server

include:
  - uwsgi.install
  #TODO remove this if archlinux or change this for OTHER OS.
  {% if grains['os_family']=="Debian" %}
  - uwsgi.service
  - uwsgi.applications
  {% endif %} #END: os = debian


