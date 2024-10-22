---
title: "BatLit References"
---

{% assign version = site.data.versions | sort: "name" | last -%}
Bibiographic References for BatLit **{{ version.name }}** ```{{ version.id }}```

Download as: [refs.csv](refs.csv) or [refs.tsv](refs.tsv).

💡 Click on titles, journal or DOI to find associated records (if any) in [Zenodo's BatLit community](https://zenodo.org/communities/batlit).

{% assign refs = site.data.refs | sort: "authors" -%}
{% for ref in refs %}
 {{ ref.authors | split: ' | ' | trim | join: ', ' }} ({{ ref.date }}) **[{{ ref.title | replace: '|', '\|' }}]({{ ref.title | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }})** _[{{ ref.journal }}]( {{ ref.journal | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }} )_ [doi: {{ ref.doi }}]({{ ref.doi | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }})

{% endfor %}
