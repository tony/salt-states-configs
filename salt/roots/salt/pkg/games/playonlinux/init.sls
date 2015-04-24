playonlinux:
  cmd.wait:
    #- name: sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
    - name: wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
    - unless: apt-key list  | grep C4676186
    - require:
      - file: playonlinux
  file:
    - managed
    - name: /etc/apt/sources.list.d/playonlinux.list
    - source: http://deb.playonlinux.com/playonlinux_precise.list
    - source_hash: md5=c31a04be321a90513fb39bd4df73905a
  pkg:
    - installed
    - refresh: True
    - names:
      - playonlinux
      - p7zip-full
      - xterm
    - require:
      - cmd: playonlinux
