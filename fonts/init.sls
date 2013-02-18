/home/{{ pillar['username'] }}/.fonts:
  file.recurse:
    - source: salt://fonts/fonts
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - file_mode: 644
    - dir_mode: 755
    - recurse:
      - user
      - group

# takin care of biz in a fixed width font
fixed-width-fonts:
   pkg.installed:
     - names:
       - ttf-inconsolata

chinese-fonts:
  pkg.installed:
    - names:
      - ttf-wqy-microhei

windows-fonts:
  pkg.installed:
    - names:
      - ttf-mscorefonts-installer

flush-font-cache:
  cmd.run:
    - name: fc-cache -f
    - user: {{ pillar['username'] }}
    - group: {{ pillar['username'] }}
    - cwd: /home/{{ pillar['username'] }}
