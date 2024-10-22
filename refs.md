---
title: "references"
---

[reference list](refs.csv) / ([csv](refs.csv)/[tsv](refs.tsv))

{% assign refs = site.data.refs | sort: "authors" -%}
{% for ref in refs %}
 {{ ref.authors | split: ' | ' | trim | join: ', ' }} ({{ ref.date }}) **[{{ ref.title | replace: '|', '\|' }}]({{ ref.title | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }})** _[{{ ref.journal }}]( {{ ref.journal | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }} )_ 

{% endfor %}
