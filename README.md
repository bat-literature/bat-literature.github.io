The Bat Literature Project facilitates discovery of scientific literature on bats (Chiroptera).

by Aja C. Sherman (curator, batbase.org), Jorrit H. Poelen (reviewer, archivist), Donat Agosti (reviewer, Plazi), Cullen K. Geiselman (reviewer, batbase.org), [your name here]

with contributions from DeeAnn Reeder, Nancy Simmons, Kendra Phelps, ...

⚠️ this is a work in progress⚠️

[Introduction](#introduction) / [Methods](#methods) / [Results](#results) / [Discussion](#Discussion)

## Contributing

If you have any comments, suggestions, or questions, please open [an issue](https://github.com/bat-literature/bat-literature.github.io/issues/new). 

## Version History

 | name | version | date | size | # references | # attachments | fingerprint |
 | --- | --- | --- | --- | --- | --- | --- |
 | Bat Literature Corpus | v0.1 | 2024-04-26 | 7.9 GiB | 2929 | 5055 | [hash://sha256/6ba...189](https://linker.bio/hash://sha256/6ba3d79cf1fd6349012cb4e527b6727b3e41e140489fa9c02f132e2cdd88d189) |  
 | Bat Literature Corpus | v0.2 | 2024-05-16/2024-05-17 | 11.6 GiB | 3310 | 5471 | [hash://md5/be6...1d7](https://linker.bio/hash://md5/be692b93a8edde4c4269be9e7d4ec1d7) |  
 | Bat Literature Corpus | v0.3 | 2024-06-25/2024-06-26 | 13.6 GiB | 5501 | 7229 | [hash://md5/350...77d](https://linker.bio/hash://md5/350f87ae6b68b96bec135c1d6ebac77d) |  

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
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat --algo md5 --remote file://[source dir]/data\
 > /dev/null
```

### Statistics

Estimating number of references in a corpus version - 

```
preston head --algo md5\
 | preston cat\
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat\
 | jq -c .[]\
 | jq --raw-output -c '.data | select(has("creators"))'\
 | wc -l
```

Estimating number of associated corpus pdfs - 

```
preston head --algo md5\
 | preston cat\
 | grep "file/view"\
 | grep hasVersion\
 | grep hash\
 | wc -l
```

Estimating the total volume of data for the most recent (i.e. "head") version

```
preston head --algo md5\
 | preston cat\
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
preston head --algo md5\
 | preston cat\
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat\
 | jq -c .[]\
 | head -n1\
 | jq .
```


 is shown below:

```json 
{
  "key": "B8YKFARF",
  "version": 15487,
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
      "href": "https://api.zotero.org/groups/5435545/items/B8YKFARF",
      "type": "application/json"
    },
    "alternate": {
      "href": "https://www.zotero.org/groups/bat_literature_project/items/B8YKFARF",
      "type": "text/html"
    },
    "up": {
      "href": "https://api.zotero.org/groups/5435545/items/7CW5CSQN",
      "type": "application/json"
    },
    "enclosure": {
      "type": "application/pdf",
      "href": "https://api.zotero.org/groups/5435545/items/B8YKFARF/file/view",
      "title": "Smith et al. - 2009 - The role of infectious diseases in biological cons.pdf",
      "length": 183580
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
    "key": "B8YKFARF",
    "version": 15487,
    "parentItem": "7CW5CSQN",
    "itemType": "attachment",
    "linkMode": "imported_file",
    "title": "Smith et al. - 2009 - The role of infectious diseases in biological cons.pdf",
    "accessDate": "",
    "url": "",
    "note": "",
    "contentType": "application/pdf",
    "charset": "",
    "filename": "Smith et al. - 2009 - The role of infectious diseases in biological cons.pdf",
    "md5": "f1f2be0ed545fb6d80b413405338d939",
    "mtime": 1719333057120,
    "tags": [],
    "relations": {
      "dc:replaces": "http://zotero.org/groups/5435545/items/6A6Z47D7"
    },
    "dateAdded": "2024-06-25T20:26:21Z",
    "dateModified": "2024-06-25T23:42:47Z"
  }
}
```

### Literature Records by Type

The tracked metadata was used to list the kinds of content included in the Bat Literature Corpus. 

The follow bash script was used to generated the content type frequency table below.

```bash
cat\
 <(echo count contentType)\
 <(preston cat hash://md5/350f87ae6b68b96bec135c1d6ebac77d | grep items? | grep hasVersion | preston cat | jq --raw-output '.[].data.itemType' | sort | uniq -c | sort -nr)\
 | mlr --ipprint --omd cat 
```

Note that there's roughly two kinds of content: top level content like journal articles, books, reports and conference papers. These top level content may have one of more association with associated content like attachments, notes, and annotations. 

| count | contentType |
| --- | --- |
| 8575 | attachment |
| 5167 | journalArticle |
| 743 | note |
| 110 | book |
| 103 | bookSection |
| 94 | annotation |
| 51 | report |
| 19 | preprint |
| 17 | conferencePaper |
| 12 | thesis |
| 9 | magazineArticle |
| 6 | webpage |
| 4 | dataset |
| 3 | newspaperArticle |

### Literature Record Index

Literature records can be extracted from this corpus in various ways. As an example, we show the output of an executed script in [bin/list-refs.sh](bin/list-refs.sh) again a recent version of the BatLit Corpus. For ease of processing, we've included a sample of 10 records in the table below, as well as files in tsv/csv formats include 100 records and all records.

| filenames | description |
| --- | --- |
| [refs-100.tsv](refs-100.tsv) / [refs-100.csv](refs-100.csv) | author/date/title/journal of first 100 records
| [refs.tsv](refs.tsv) / [refs.csv](refs.csv) | author/date/title/journal of all records

First 3 records shown below as an example:

| id | authors | date | title | journal | doi |
| --- | --- | --- | --- | --- | --- |
| https://www.zotero.org/groups/bat_literature_project/items/7CW5CSQN | Smith \| Acevedo‐Whitehouse \| Pedersen | 02/2009 | The role of infectious diseases in biological conservation | Animal Conservation | 10.1111/j.1469-1795.2008.00228.x |
| https://www.zotero.org/groups/bat_literature_project/items/MTXHK7WY | Whittaker \| Jones | 1994 | The Role of Frugivorous Bats and Birds in the Rebuilding of a Tropical Forest Ecosystem, Krakatau, Indonesia | Journal of Biogeography | 10.2307/2845528 |
| https://www.zotero.org/groups/bat_literature_project/items/CHPT6L4L | Hoff \| Bigler | 1981 | The role of bats in the propagation and spread of histoplasmosis: a review. | Journal of wildlife diseases | 10.7589/0090-3558-17.2.191 |

## Discussion
