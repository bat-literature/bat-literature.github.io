---
title: "BatLit References"
---

{% assign version = site.data.versions | sort: "name" | last -%}
Bibiographic References for BatLit **{{ version.name }}** ```{{ version.id }}```

Download as: [refs.csv](refs.csv) or [refs.tsv](refs.tsv).

💡 Click on titles, journal or Zenodo-minted alternative DOIs to find associated records (if any) in [Zenodo's BatLit community](https://zenodo.org/communities/batlit).

{% assign refs = site.data.refs | sort: "authors" -%}
{% for ref in refs %} 
 {% assign authors = ref.authors | remove: ' ' | split: '|' | compact -%}
 {% if authors.size > 0 -%}
 {{ authors | join: ', ' }} ({{ ref.date }}) **[{{ ref.title | replace: '|', '\|' }}]({{ ref.title | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }})** _{{ ref.journal }}_
 [{{ ref.attachmentId }}]({{ ref.attachmentId | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }}) 
 {% if ref.alternativeDoi.size > 0 -%}
   [doi:{{ ref.alternativeDoi }}]({{ ref.alternativeDoiUrl }}) 
 {% endif -%}
  {% endif -%}

{% endfor %}
