mopidy:
  pkgrepo.managed:
    - human_name: Mopidy Repository
    - name: deb http://apt.mopidy.com stable main
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/mopidy.list
    - keyid: 271D2943
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mopidy
  pkg:
    - latest
