{% from "opencart/map.jinja" import map with context %}

# This downloads and installs ocok
/usr/local/bin/ocok:
  file.managed:
    - source: {{ salt['pillar.get']('opencart:cli:source') }}
    - source_hash: {{ salt['pillar.get']('opencart:cli:hash') }}
    - user: {{ map.www_user }}
    - group: {{ map.www_group }}
    - mode: 740