{% from "opencart/map.jinja" import map with context %}
{% for site in pillar['opencart']['sites'] %}

{% if site.get('backup') %}
# This command tells ocok to backup opencart
backup_{{ id }}:
 cmd.run:
  - cwd: {{ map.docroot }}/{{ id }}
  - name: 'ocok backup -i -d'
  - user: {{ map.www_user }}
{% endif %}

{% endfor %}