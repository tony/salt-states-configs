/home/tony/.fonts:
  file.recurse:
    - source: salt://fonts/fonts
    - user: tony 
    - group: tony 
    - file_mode: 644
    - dir_mode: 755
    - recurse:
      - user
      - group

pixel-fonts:
  pkg.installed:
    - names:
      - xfonts-terminus

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
    - user: tony
    - group: tony
    - cwd: /home/tony
