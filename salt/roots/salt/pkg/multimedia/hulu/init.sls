huludesktop:
  pkg.installed:
    - sources:
    {%- if grains['cpuarch'] == "i686" %}
      - huludesktop: http://download.hulu.com/huludesktop_i386.deb
    {%- elif grains['cpuarch'] == "x86_64" %}
      - huludesktop: http://download.hulu.com/huludesktop_amd64.deb
    {%- endif %}

huludesktop-flash:
  file.managed:
    {%- if grains['cpuarch'] == "i686" %}
    - source: salt://multimedia/hulu/files/libflashplayer-11_1r102_63_32bit.so
    - name: /home/{{ pillar['username'] }}/.hulu/libflashplayer-11_1r102_63_32bit.so
    {%- elif grains['cpuarch'] == "x86_64" %}
    - source: salt://multimedia/hulu/files/libflashplayer-11_1r102_63_64bit.so
    - name: /home/{{ pillar['username'] }}/.hulu/libflashplayer-11_1r102_63_64bit.so
    {%- endif %}
    - mode: 755
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
  require:
    - file: huludesktop-flash-config
    - pkg: huludesktop


huludesktop-flash-config:
  file.managed:
    - source: salt://multimedia/hulu/files/huludesktop
    - name: /home/{{ pillar['username'] }}/.huludesktop
    - mode: 755
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - template: jinja
  require:
    - file: huludesktop-flash
    - pkg: huludesktop
