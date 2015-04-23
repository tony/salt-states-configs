# https://github.com/saltstack-formulas/uwsgi-formula - Apache 2
# @ 24e951a8e5f9c1

# uwsgi
# 
# Meta state to install uwsgi server

include:
  - .install
  #TODO remove this if archlinux or change this for OTHER OS.
  {% if grains['os_family']=="Debian" %}
  - .service
  - .applications
  {% endif %} #END: os = debian


