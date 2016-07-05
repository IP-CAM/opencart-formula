{% from "opencart/map.jinja" import map with context %}

# This downloads and installs ocok
ocok_cli:
  cmd.run:
    name: 'composer global require beyondit/ocok'
    runas: {{ map.www_user }}
