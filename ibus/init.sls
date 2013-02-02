include:
  - bashrc

ibus:
  pkg.latest:
    - names:
      - ibus-gtk
      - ibus-gtk3
      - ibus-qt4
    - require_in:
      - file: ibus-bashrc


ibus-table:
  pkg.latest:
    - names:
      - ibus-googlepinyin
  require:
    - pkg: ibus

ibus-bashrc:
  file.append:
    - name: /home/{{ pillar['username'] }}/.bashrc
    - text:
      - export GTK_IM_MODULE=ibus
      - export XMODIFIERS=@im=ibus
      - export QT_IM_MODULE=ibus
    - require:
      - file: /home/{{ pillar['username'] }}/.bashrc
