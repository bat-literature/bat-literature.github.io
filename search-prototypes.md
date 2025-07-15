---
title: Search BatLit
---

## <a name="search"></a>BatLit Search

Users can search BatLit through a variety of methods. One way is to go to the [**BatLit References**](refs) page and use the search box find a citation. Another way is to search the [BatLit community hosted on Zenodo](https://zenodo.org/communities/batlit/), with some simple examples shown below. Alternatively, users can access the Zenodo-published version of BatLit through the Zenodo API from the command line. 

<form class="searchbox" action="https://zenodo.org/communities/batlit">
  <input type="search" id="name" name="q" placeholder="Search BatLit..." value="&quot;Rhinolophus sinicus&quot;"/>
  <button type="submit">Search</button>
</form><a href="https://zenodo.org/help/search">Search guide</a>

### Example Searches

Works published in 1994 mentioning "Koopman": 

<form class="searchbox" action="https://zenodo.org/communities/batlit">
  <input type="search" id="name" name="q" placeholder="Search BatLit..." value="metadata.publication_date:1994 Koopman"/>
  <button type="submit">Search</button>
</form>

<p></p>
<div/>

[Plazi's Literature Search Prototype](https://stage.plazi.org/litsearch/), which uses the same Zenodo API and technologies (e.g., html/javascript) in a more sophisticated way, can be found below: 
<embed src="https://stage.plazi.org/litsearch/" style="width:600px; height: 400px;">

<div/>


## Cite 

{% include citation.html %}

