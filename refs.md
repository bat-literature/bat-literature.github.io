---
title: Search
permalink: /search/
---


{% assign version = site.data.versions | sort: "name" | last -%}
Bibiographic References for BatLit **{{ version.name }}** ```{{ version.id }}```

Looking for all BatLit references? Download [refs.csv](refs.csv), [refs.tsv](refs.tsv) or visit [Zenodo's BatLit Community](https://zenodo.org/communities/batlit) .

{% include search.html %}

💡 Click on titles, journal or Zenodo-minted alternative DOIs to find associated records (if any) in [Zenodo's BatLit community](https://zenodo.org/communities/batlit).

<span><b><span id="results"></span></b></span>

{% assign refs = site.data.refs | sort: "authors" -%}
{% for ref in refs %} 
 <span id="{{ ref.id }}" class="ref" style="display: none">
 {% assign authors = ref.authors | remove: ' ' | split: '|' | compact -%}
 {% if authors.size > 0 -%}
 {{ authors | join: ', ' }} ({{ ref.date }}) **[{{ ref.title | replace: '|', '\|' }}]({{ ref.title | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }})** _{{ ref.journal }}_
 [{{ ref.attachmentId }}]({{ ref.attachmentId | url_encode | prepend: "https://zenodo.org/communities/batlit/records?q=%22" | append: "%22" }}) 
 {% if ref.alternativeDoi.size > 0 -%}
   . Zenodo [doi:{{ ref.alternativeDoi }}]({{ ref.alternativeDoiUrl }}) 
 {% endif -%}
 {% if ref.doi.size > 0 -%}
   . Publisher version: [doi:{{ ref.doi }}](https://doi.org/{{ ref.doi }}) 
 {% endif -%}
  {% endif -%}
 </span>
{% endfor %}
