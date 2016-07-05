{% from "opencart/map.jinja" import map with context %}

include:
  - opencart.cli

{{ map.tmp_dir }}/opencart.zip:
  file.managed:
    - source: {{ salt['pillar.get']('opencart:source') }}
    - source_hash: {{ salt['pillar.get']('opencart:hash') }}
    - user: {{ map.www_user }}
    - group: {{ map.www_group }}
    - mode: 640

{% for id, site in salt['pillar.get']('opencart:sites', {}).items() %}
{{ map.docroot }}/{{ id }}:
  file.directory:
    - user: {{ map.www_user }}
    - group: {{ map.www_group }}
    - mode: 755
    - makedirs: True

{% if site.get('source') %}
/tmp/opencart_{{ id }}.zip:
  file.managed:
    - source: {{ site.get('source') }}
    - source_hash: {{ site.get('hash') }}
    - user: {{ map.www_user }}
    - group: {{ map.www_group }}
    - mode: 640
{% endif %}   

{{ id }}_config:
  file.managed:
    - name: /etc/opencart/{{ id }}_config_si.php
    - source: salt://opencart/files/config_si.php
    - user: {{ map.www_user}}
    - group: {{ map.www_group }}
    - mode: 640
    - template: jinja
    - defaults:
        dbuser: "{{ site.get('dbuser') }}"
        dbpass: "{{ site.get('dbpass') }}"
        database: "{{ site.get('database') }}"
        dbhost: "{{ site.get('dbhost') }}"        
        url: "{{ site.get('url') }}"
        username: "{{ site.get('username') }}"
        password: "{{ site.get('password') }}"
        license: "{{ site.get('license', '') }}"
        title: "{{ site.get('title', '') }}"

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
