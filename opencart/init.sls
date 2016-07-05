{% from "opencart/map.jinja" import map with context %}

include:
  - opencart.cli

{% for id, site in salt['pillar.get']('opencart:sites', {}).items() %}
{{ map.docroot }}/{{ id }}:
  file.directory:
    - user: {{ map.www_user }}
    - group: {{ map.www_group }}
    - mode: 755
    - makedirs: True

{% if site.get('source') %}
extract_opencart_{{ id }}:
  archive.extracted:
    - name: {{ map.docroot }}/{{ id }}
    - source: {{ salt['pillar.get']('opencart:source') }}
    - source_hash: {{ salt['pillar.get']('opencart:hash') }}
    - archive_format: zip
    - user: {{ map.www_user }}
    - group: {{ map.www_group }}
    - if_missing: {{ map.docroot }}/{{ id }}/
{% else %}
extract_opencart_{{ id }}:
  archive.extracted:
    - name: {{ map.docroot }}/{{ id }}
    - source: {{ site.get('source') }}
    - source_hash: {{ site.get('hash') }}
    - archive_format: zip
    - user: {{ map.www_user }}
    - group: {{ map.www_group }}
    - if_missing: {{ map.docroot }}/{{ id }}/
{% endif %}   

# This command tells ocok to install opencart
install_{{ id }}:
 cmd.run:
  - cwd: {{ map.docroot }}/{{ id }}
  - name: 'ocok install -d {{ site.get('dbdriver') }} -o {{ site.get('dbhost') }} -u {{ site.get('dbuser') }} -p {{ site.get('dbpass') }} -b {{ site.get('database') }} -U {{ site.get('username') }} -P {{ site.get('password') }} -e {{ site.get('email') }} -s {{ site.get('url') }}'
  - user: {{ map.www_user }}
  - unless: test -f {{ map.docroot }}/{{ id }}/config.php


{{ map.docroot }}/{{ id }}/config_si.php:
  file.symlink:
    - target: /etc/opencart/{{id}}_config_si.php
{% endfor %}
