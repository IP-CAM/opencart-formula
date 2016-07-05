{% from "opencart/map.jinja" import map with context %}
{% for site in pillar['opencart']['sites'] %}

config_{{ id }}:
  file.managed:
    - name: {{ map.docroot }}/{{ id }}/config.php
    - source: salt://opencart/files/config.php
    - user: {{ map.www_user}}
    - group: {{ map.www_group }}
    - mode: 640
    - template: jinja
    - defaults:
        dbuser: "{{ site.get('dbuser') }}"
        dbpass: "{{ site.get('dbpass') }}"
        database: "{{ site.get('database') }}"
        dbhost: "{{ site.get('dbhost') }}"   
        dbport: "{{ site.get('dbport', 3306) }}"    
        dbdriver: "{{ site.get('dbdriver', 'mpdo') }}"
        url: "{{ site.get('url') }}"
        path: "{{ map.docroot }}/{{ id }}"

config_{{ id }}_admin:
  file.managed:
    - name: {{ map.docroot }}/{{ id }}/admin/config.php
    - source: salt://opencart/files/admin_config.php
    - user: {{ map.www_user}}
    - group: {{ map.www_group }}
    - mode: 640
    - template: jinja
    - defaults:
        dbuser: "{{ site.get('dbuser') }}"
        dbpass: "{{ site.get('dbpass') }}"
        database: "{{ site.get('database') }}"
        dbhost: "{{ site.get('dbhost') }}"      
        dbport: "{{ site.get('dbport', 3306) }}"      
        dbdriver: "{{ site.get('dbdriver', 'mpdo') }}"        
        url: "{{ site.get('url') }}"
        path: "{{ map.docroot }}/{{ id }}"
{% endfor %}