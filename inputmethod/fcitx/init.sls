fcitx:
  pkg.installed:
    - names:
      - fcitx
      - fcitx-googlepinyin
      - libgooglepinyin0

ibus-bashrc:
  file.append:
    - name: /home/{{ pillar['username'] }}/.bashrc
    - text:
      - export XMODIFIERS="@im=fcitx"
      - export GTK_IM_MODULE=xim
      - export QT_IM_MODULE=xim
    - require:
      - file: /home/{{ pillar['username'] }}/.bashrc
