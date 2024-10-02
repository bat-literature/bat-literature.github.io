[edit page](https://github.com/bat-literature/bat-literature.github.io/edit/main/README.md) / [share feedback](https://github.com/bat-literature/bat-literature.github.io/issues/new)

<form class="searchbox" action="https://zenodo.org/communities/batlit">
  <input type="search" id="name" name="q" placeholder="Search BatLit..." value="&quot;Rhinolophus sinicus&quot;"/>
  <button type="submit">Search</button>
</form><a href="https://zenodo.org/help/search">Search guide</a>

<div/>

The Bat Literature Project (BatLit) facilitates discovery of scientific literature on bats (Chiroptera).

by Aja C. Sherman (curator, batbase.org), Jorrit H. Poelen (reviewer, archivist), Donat Agosti (reviewer, Plazi), Cullen K. Geiselman (reviewer, batbase.org). 

Cite as:

> Sherman, A.C., ..., Simmons, N.B., Zijlstra, J.S., Geiselman C.K. 2024. Bat Literature Project (BatLit, https://batlit.org) v0.6 hash://md5/db73e659e8cf16ef50e82bb5e72ae97b .

with contributions from DeeAnn Reeder, Nancy Simmons, Kendra Phelps, ...

⚠️ this is a work in progress⚠️

[Introduction](#introduction) / [Methods](#methods) / [Prerequisites](#prerequisites) / [Results](#results) / [Discussion](#Discussion)

## Getting Started

If you'd like to explore BatLit, please review the examples below. Alternatively, if you'd like to learn more about why BatLit exists, and how it was built, please skip to the [`Introduction`](#introduction).

### Searching for Literature by Keywords 

One way BatLit can be searched and discovered is through Zenodo at [https://zenodo.org/communities/batlit](https://zenodo.org/communities/batlit). Zenodo offers search features through a point-and-click web interface, as well as a Web Application Programming Interface (Web API, [https://developers.zenodo.org](https://developers.zenodo.org)).   

For instance, let's say that Carla would like to search for literature that mention "Rhinolophus sinicus" in their associated metadata (e.g., title, abstract). She uses Zenodo and enters "Rhinolophus sinicus" in the search box of the BatLit community producing the following query: [https://zenodo.org/communities/batlit/records?q=rhinolophus%20sinicus](https://zenodo.org/communities/batlit/records?q=rhinolophus%20sinicus) . On inspecting the initial results, she limits to see only publications that are openly available by selecting `Access Status > Open` in the Zenodo web search results. 

[![search dropdown](assets/zenodo-search.png)](https://zenodo.org/communities/batlit/records?q=rhinolophus%20sinicus)

[![results](assets/zenodo-results.png)](https://zenodo.org/communities/batlit/records?q=rhinolophus%20sinicus)

### Searching by Zotero Record Identifiers

BatLit is managed in Zotero. Each Zotero record has a group id and an item id. These ids uniquely identify a record. These ids are combined to create a life science identifier for each Zotero literature record with the following syntax:

```
urn:lsid:zotero.org:groups:[group id]:items:[item id]
```

For example, the Zotero record with group id `5435545` (the batlit group) and item id `C4GD9Y6Q` has a lsid:

```
urn:lsid:zotero.org:groups:5435545:items:C4GD9Y6Q
```

Now, you can search Zenodo for deposits (publications) related to this particular Zotero record by putting the lsid (in double quotes) in the search box. After hitting "enter", you are directed to the following [search results page](https://zenodo.org/communities/batlit/records?q=%22urn%3Alsid%3Azotero.org%3Agroups%3A5435545%3Aitems%3AC4GD9Y6Q%22) .  

[![search by id](assets/zenodo-search-by-id.png)](https://zenodo.org/communities/batlit/records?q=%22urn%3Alsid%3Azotero.org%3Agroups%3A5435545%3Aitems%3AC4GD9Y6Q%22)

The example above shows that BatLit records in Zotero are linked to their derived records in Zenodo by their record identifiers.

### More Advanced Queries

Because BatLit is integrated with Zenodo, you can benefit from the powerful features of the Zenodo Web Search and Zenodo Web API for discovery. See [https://developers.zenodo.org](https://developers.zenodo.org) for more information.  

## Contributing

If you have any comments, suggestions, or questions, please open [an issue](https://github.com/bat-literature/bat-literature.github.io/issues/new). 

## Version History

 | name | version | date | size | # references | # attachments | fingerprint |
 | --- | --- | --- | --- | --- | --- | --- |
 | Bat Literature Corpus | v0.1 | 2024-04-26 | 7.9 GiB | 2929 | 5055 | [hash://sha256/6ba...189](https://linker.bio/hash://sha256/6ba3d79cf1fd6349012cb4e527b6727b3e41e140489fa9c02f132e2cdd88d189) |  
 | Bat Literature Corpus | v0.2 | 2024-05-16/2024-05-17 | 11.6 GiB | 3310 | 5471 | [hash://md5/be6...1d7](https://linker.bio/hash://md5/be692b93a8edde4c4269be9e7d4ec1d7) |  
 | Bat Literature Corpus | v0.3 | 2024-06-25/2024-06-26 | 13.6 GiB | 5501 | 7229 | [hash://md5/350...77d](https://linker.bio/hash://md5/350f87ae6b68b96bec135c1d6ebac77d) |  
 | Bat Literature Corpus | v0.4 | 2024-08-01/2024-08-02 | 50.9 GiB | 20146 | 29860 | [hash://md5/b39...72a](https://linker.bio/hash://md5/b394bdb081f55916b1226b5bc8ba972a) |  
 | Bat Literature Corpus | v0.5 | 2024-08-16/2024-08-17 | 50.9 GiB | 20145 | 29850 | [hash://md5/26f...b20](https://linker.bio/hash://md5/26f7ce5dd404e33c6570edd4ba250d20) |  
 | Bat Literature Corpus | v0.6 | 2024-09-19/2024-09-20 | 44.7GiB | 19038 | 22590 | [hash://md5/db7...97b](https://linker.bio/hash://md5/db73e659e8cf16ef50e82bb5e72ae97b) |  

## Introduction

Bat researchers rely on access to a vast corpus of bat literature to help advance our understanding of bats and the ecosystems they live in. Many researchers build and organize their personal literature collections using mainstream digital tools like Zotero and EndNote, whereas others use homegrown digital methods or even manage their collections manually. However, all researchers routinely encounter roadblocks to literature access including paywalls and older literature resources that have not yet been digitized.  To help provide access to bat research literature for all, Plazi (https://plazi.org) and the GBatNet Bat Eco-Interactions Working Group are compiling the Bat Literature Corpus (BatLit). BatLit is an actively managed, digital, versioned, and citable collection of bat research literature and associated metadata compiled from existing literature contributed by bat researchers. BatLit is designed to be used in manual (e.g., point-and-click) as well as automated workflows (e.g., text mining, language model training), and can be accessed in many ways, including, but not limited to, external storage media, Zenodo and GitHub. As BatLit continues to improve and grow, we aim to continue to democratize access to bat literature, accelerate research, and help reduce the barrier to knowledge for bat researchers around the world. We invite you to contribute your reference library, especially the PDFs, to BatLit and help increase information access for all.

## Methods

We use [Zotero](https://zotero.org) for managing our literature corpus, and [Preston](https://github.com/bio-guoda/preston) for tracking their associated content in a versioned corpus. This versioned corpus is designed to be published through various channels such as local storage media (e.g., external harddisk), GitHub pages and Zenodo.


```
(Bat Literature Zotero Group) -[:track]-> (Bat Literature Corpus) 

(Bat Literature Corpus) -[:publish]-> (https://bat-literature.github.io)

(Bat Literature Corpus) -[:publish]-> (Zenodo BLR)
```

### Curation Workflow

To help keep BatLit current (e.g., add new references) and accurate (e.g., update existing records), we've implemented the following curation workflows: 

#### New References Workflow

1. BatLit community solicits bat literature references and their associated digital copies 
2. provided literature references and digital copies (e.g., pdfs) are reviewed
3. on passing review, literature references are added to BatLit

#### Feedback Workflow

1. BatLit Community Solicits feedback on published BatLit versions
2. on receiving feedback, the batlit curator documents the request in a github issue
3. open issues are reviewed by the editorial board under guidance of the curator
4. if needed, existing records are updated to address the provided issue

#### Deduplication Workflow

1. Data curator merges duplicate entries entries using the Zotero merge tool
2. Data archivist take a versioned snapshot of the Zotero group
3. Preston (or some other robot) detects relations like:

```json
{ 
 "...": "...",
"key": "YWNCWPYJ",
 "...": "...",
"relations": {
            "dc:replaces": "http://zotero.org/groups/5435545/items/2PWXAVQL"
        }
 "...": "...",
}
```
and translates this into an action to annotate any existing Zenodo record associated with http://zotero.org/groups/5435545/items/2PWXAVQL (or urn:lsid:zotero.org:groups:5435545:items:2PWXAVQL)
 as deprecated and being replaced by https://www.zotero.org/groups/5435545/items/YWNCWPYJ (or urn:lsid:zotero.org:groups:5435545:items:YWNCWPYJ), or

```
(urn:lsid:zotero.org:groups:5435545:items:2PWXAVQL) 
  -[:replaced_by]-> 
    (urn:lsid:zotero.org:groups:5435545:items:YWNCWPYJ)
```

For context see notes related to [`approach curating duplicate literature entries`](https://github.com/bat-literature/bat-literature.github.io/issues/6).

### Prerequisites

In the following sections, some examples are listed that uses a notation commonly used in the [Unix shell](https://librarycarpentry.org/lc-shell/), also known as the "commandline" or "terminal". And, at the time of writing, these examples can be executed/run provided the following programs are available: [preston](https://github.com/bio-guoda/preston), [jq](https://jqlang.github.io/jq/), [mlr](https://miller.readthedocs.io/en/6.12.0/) as well as more commonly available unix/posix/linux programs like [grep](https://en.wikipedia.org/wiki/Grep), [sort](https://en.wikipedia.org/wiki/Sort_(Unix)), and [uniq](https://en.wikipedia.org/wiki/Uniq). 

To run these programs, please use some Linux distribution, MacOS, or [Windows Subsystem for Linux](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux) (WSL) available on Windows 10 and higher. 

Also, please make sure to install [preston](https://github.com/bio-guoda/preston#quickstart), [jq](https://jqlang.github.io/jq/), and [mlr](https://miller.readthedocs.io/en/6.12.0/).  

The tools used in the example workflows are designed to handle lots of data quickly using so-called ["Standard Streams"](https://en.wikipedia.org/wiki/Standard_streams). In addition, they have the ability to run offline after an initial caching (or cloning) of remote resources. If you are unfamiliar with these tools or processing methods and would like to learn more, you may benefit from a Carpentries Lesson like https://librarycarpentry.org/lc-shell/ or many of the other educational materials. Note that some of these tools have been around since the 1970s, are well documented and are likely to stick around a little while longer.  

### Tracking 

To track the Zotero group and compile a version of the bat literature corpus, the following command is used (in bash/linux):

```bash
ZOTERO_TOKEN=[SECRET] preston track --algo md5 https://www.zotero.org/groups/5435545/bat_literature_project
```

Note that this group has access restrictions for copyright reasons. This is why you need to replace the "[SECRET]" with your personal access token.

### Publishing Metadata

To publish the batlit metadata only (not pdfs), use the following commands

```
# first copy provenance index
preston cp --algo md5 --type provindex [target dir]/data

# then copy the provenance 
preston cp --algo md5 --type prov [target dir]/data

cd [target dir]

# and get the associated zotero metadata
preston ls --algo md5\
 | grep -v "file/view"\
 | grep hasVersion\
 | preston cat --algo md5 --remote file://[source dir]/data\
 > /dev/null
```

### Statistics

Estimating number of references in a corpus version - 

```
preston cat --remote https://linker.bio hash://md5/db73e659e8cf16ef50e82bb5e72ae97b\
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat --remote https://linker.bio\
 | jq -c '.[]'\
 | jq --raw-output -c '.data | select(has("creators"))'\
 | wc -l
```

Estimating number of associated corpus pdfs - 

```
preston cat --remote https://linker.bio hash://md5/db73e659e8cf16ef50e82bb5e72ae97b\
 | grep "file/view"\
 | grep hasVersion\
 | grep hash\
 | wc -l
```

Estimating the total volume of data for the most recent (i.e. "head") version

```
preston cat --remote https://linker.bio hash://md5/db73e659e8cf16ef50e82bb5e72ae97b\
 | grep hasVersion\
 | grep -oE "hash://md5/[a-f0-9]{32}"\
 | sort\
 | uniq\
 | preston cat\
 | pv > /dev/null
```

## Results

### Example of Tracked Zotero Record
An example of a tracked Zotero record generated using

```bash
preston cat --remote https://linker.bio hash://md5/db73e659e8cf16ef50e82bb5e72ae97b\
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat --remote https://linker.bio\
 | jq -c '.[]'\
 | head -n1\
 | jq .
```


 is shown below:

```json 
{
  "key": "6TEYS6CT",
  "version": 60055,
  "library": {
    "type": "group",
    "id": 5435545,
    "name": "Bat Literature Project",
    "links": {
      "alternate": {
        "href": "https://www.zotero.org/groups/bat_literature_project",
        "type": "text/html"
      }
    }
  },
  "links": {
    "self": {
      "href": "https://api.zotero.org/groups/5435545/items/6TEYS6CT",
      "type": "application/json"
    },
    "alternate": {
      "href": "https://www.zotero.org/groups/bat_literature_project/items/6TEYS6CT",
      "type": "text/html"
    },
    "up": {
      "href": "https://api.zotero.org/groups/5435545/items/ARXB2UDJ",
      "type": "application/json"
    },
    "enclosure": {
      "type": "application/pdf",
      "href": "https://api.zotero.org/groups/5435545/items/6TEYS6CT/file/view",
      "title": "1-s2.0-S2589004222010513-main.pdf",
      "length": 2286303
    }
  },
  "meta": {
    "createdByUser": {
      "id": 13229919,
      "username": "acsherman",
      "name": "",
      "links": {
        "alternate": {
          "href": "https://www.zotero.org/acsherman",
          "type": "text/html"
        }
      }
    },
    "numChildren": 0
  },
  "data": {
    "key": "6TEYS6CT",
    "version": 60055,
    "parentItem": "ARXB2UDJ",
    "itemType": "attachment",
    "linkMode": "imported_file",
    "title": "1-s2.0-S2589004222010513-main",
    "accessDate": "",
    "url": "",
    "note": "",
    "contentType": "application/pdf",
    "charset": "",
    "filename": "1-s2.0-S2589004222010513-main.pdf",
    "md5": "7d24ebd866e9b3b0a74ce9a6577d8677",
    "mtime": 1726696006321,
    "tags": [],
    "relations": {},
    "dateAdded": "2024-09-18T21:46:56Z",
    "dateModified": "2024-09-18T21:46:56Z"
  }
}
```

### Literature Records by Type

The tracked metadata was used to list the kinds of content included in the Bat Literature Corpus. 

The follow bash script was used to generated the content type frequency table below.

```bash
cat\
 <(echo count contentType)\
 <(preston cat --remote https://linker.bio hash://md5/db73e659e8cf16ef50e82bb5e72ae97b | grep items? | grep hasVersion | preston cat --remote https://linker.bio | jq --raw-output '.[].data.itemType' | sort | uniq -c | sort -nr)\
 | mlr --ipprint --omd cat 
```

Note that there's roughly two kinds of content: top level content like journal articles, books, reports and conference papers. These top level content may have one of more association with associated content like attachments, notes, and annotations. 

| count | contentType |
| --- | --- |
| 23831 | attachment |
| 18176 | journalArticle |
| 637 | note |
| 358 | book |
| 269 | bookSection |
| 95 | annotation |
| 93 | report |
| 53 | thesis |
| 33 | conferencePaper |
| 21 | preprint |
| 15 | dataset |
| 11 | magazineArticle |
| 6 | webpage |
| 2 | newspaperArticle |
| 1 | presentation |

### Literature Record Index

Literature records can be extracted from this corpus in various ways. As an example, we show the output of an executed script in [bin/list-refs.sh](bin/list-refs.sh) again a recent version of the BatLit Corpus. For ease of processing, we've included a sample of 10 records in the table below, as well as files in tsv/csv formats include 100 records and all records.

| filenames | description |
| --- | --- |
| [refs-100.tsv](refs-100.tsv) / [refs-100.csv](refs-100.csv) | author/date/title/journal of first 100 records
| [refs.tsv](refs.tsv) / [refs.csv](refs.csv) | author/date/title/journal of all records

First 3 records shown below as an example:

| id | authors | date | title | journal | doi |
| --- | --- | --- | --- | --- | --- |
| https://www.zotero.org/groups/bat_literature_project/items/YLGQ4TQY | Vriesendorp \| Schulenberg \| Alverson \| Moskovits \| Moscoso | 2006 | Rapid biological inventories: Sierra del Divisor |  |  |
| https://www.zotero.org/groups/bat_literature_project/items/YI9XP2PF | Carus | 1896 | Wissenschaftliche Mittheilungen. | Zoologischer Anzeiger |  |
| https://www.zotero.org/groups/bat_literature_project/items/8YCQ2DAS | Handley, Jr. | 1996 | New species of mammals from northern South America: bats of the genera Histiotus Gervais and Lasiurus Gray (Chiroptera: Vespertilionidae). | PROCEEDINGS OF THE BIOLOGICAL SOCIETY OF WASHINGTON |  |

## Discussion
