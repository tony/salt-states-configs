spotify_apt_sources:
  cmd.run:
    - name: apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
    - unless: apt-key list | grep 'Spotify Public Repository Signing Key'
    - require:
      - file: /etc/apt/sources.list.d/spotify.list

/etc/apt/sources.list.d/spotify.list:
  file.managed:
    - source: salt://multimedia/spotify/etc/apt/sources.list.d/spotify.list

spotify:
  pkg.installed:
    - name: spotify-client
  require:
    - cmd: spotify_apt_sources
