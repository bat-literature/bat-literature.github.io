---
title: "BatLit References"
---

[refs.csv](refs.csv)/[refs.tsv](refs.tsv)

{% assign refs = site.data.refs | sort: "authors" -%}
{% for ref in refs %}
 {{ ref.authors | split: ' | ' | trim | join: ', ' }} ({{ ref.date }}) **[{{ ref.title | replace: '|', '\|' }}]({{ ref.title | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }})** _[{{ ref.journal }}]( {{ ref.journal | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }} )_ [doi: {{ ref.doi }}]({{ ref.doi | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }})

{% endfor %}
