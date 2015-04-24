{%if grains['os'] == 'Ubuntu' %} 
include:
  - pkg.multimedia.medibuntu.apt

medibuntu:
  pkg:
    - latest
    - names:
      - non-free-codecs
      - libdvdcss2
    - require:
      - cmd: apt-update
{% endif %}
