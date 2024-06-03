The Bat Literature Project facilitate discovery of scientific literature on bats (Chiroptera).

⚠️ this is a work in progress⚠️

[Introduction](#introduction) / [Methods](#methods) / [Results](#results) / [Discussion](#Discussion)

## Contributing

If you have any comments, suggestions, or questions, please open [an issue](https://github.com/bat-literature/bat-literature.github.io/issues/new). 

## Version History

 | name | version | date | size | # references | # attachments | fingerprint |
 | --- | --- | --- | --- | --- | --- | --- |
 | Bat Literature Corpus | v0.1 | 2024-04-26 | 7.9 GiB | 2929 | 5055 | [hash://sha256/6ba...189](https://linker.bio/hash://sha256/6ba3d79cf1fd6349012cb4e527b6727b3e41e140489fa9c02f132e2cdd88d189) |  
 | Bat Literature Corpus | v0.2 | 2024-05-16/2024-05-17 | 11.6 GiB | 3310 | 5471 | [hash://md5/be6...1d7](https://linker.bio/hash://md5/be692b93a8edde4c4269be9e7d4ec1d7) |  

## Introduction

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

#### Deduplication workflow

1. Data curator merges duplicate entries entries using the Zotero merge tool
2. Data archivist take a versioned snapshot of the Zotero group
3. Preston (or some other robot) detects relations like:

```json
"relations": {
            "dc:replaces": "http://zotero.org/groups/5435545/items/2PWXAVQL"
        }
```
and translates this into an action to annotate any existing Zenodo record associated with http://zotero.org/groups/5435545/items/2PWXAVQL (or urn:lsid:zotero.org:groups:5435545:items:2PWXAVQL)
 as deprecated and being replaced by https://www.zotero.org/groups/5435545/items/YWNCWPYJ (or urn:lsid:zotero.org:groups:5435545:items:YWNCWPYJ) .

	For context see notes related to [```approach curating duplicate literature entries
```](https://github.com/bat-literature/bat-literature.github.io/issues/6).

### Tracking 

To track the Zotero group and compile a version of the bat literature corpus, the following command is used (in bash/linux):

```bash
ZOTERO_TOKEN=[SECRET] preston track https://www.zotero.org/groups/5435545/bat_literature_project
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
  "key": "DP629R8S",
  "version": 8066,
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
      "href": "https://api.zotero.org/groups/5435545/items/DP629R8S",
      "type": "application/json"
    },
    "alternate": {
      "href": "https://www.zotero.org/groups/bat_literature_project/items/DP629R8S",
      "type": "text/html"
    },
    "attachment": {
      "href": "https://api.zotero.org/groups/5435545/items/P4LGETPS",
      "type": "application/json",
      "attachmentType": "application/pdf",
      "attachmentSize": 1117285
    }
  },
  "meta": {
    "createdByUser": {
      "id": 6296343,
      "username": "deeannreeder",
      "name": "",
      "links": {
        "alternate": {
          "href": "https://www.zotero.org/deeannreeder",
          "type": "text/html"
        }
      }
    },
    "lastModifiedByUser": {
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
    "creatorSummary": "Lytras et al.",
    "parsedDate": "2022",
    "numChildren": 2
  },
  "data": {
    "key": "DP629R8S",
    "version": 8066,
    "itemType": "journalArticle",
    "title": "Exploring the natural origins of SARS-CoV-2",
    "creators": [
      {
        "creatorType": "author",
        "firstName": "Spyros",
        "lastName": "Lytras"
      },
      {
        "creatorType": "author",
        "firstName": "Joseph",
        "lastName": "Hughes"
      },
      {
        "creatorType": "author",
        "firstName": "Darren",
        "lastName": "Martin"
      },
      {
        "creatorType": "author",
        "firstName": "Phillip",
        "lastName": "Swanepoel"
      },
      {
        "creatorType": "author",
        "firstName": "Arne",
        "lastName": "de Klerk"
      },
      {
        "creatorType": "author",
        "firstName": "Rentia",
        "lastName": "Lourens"
      },
      {
        "creatorType": "author",
        "firstName": "Sergei L.",
        "lastName": "Kosakovsky Pond"
      },
      {
        "creatorType": "author",
        "firstName": "Wei",
        "lastName": "Xia"
      },
      {
        "creatorType": "author",
        "firstName": "Xiaowei",
        "lastName": "Jiang"
      },
      {
        "creatorType": "author",
        "firstName": "David L.",
        "lastName": "Robertson"
      }
    ],
    "abstractNote": "Exploring the natural origins of SARS-CoV-2 Spyros Lytras1, Joseph Hughes1, Xiaowei Jiang2, David L Robertson1  1MRC-University of Glasgow Centre for Virus Research (CVR), Glasgow, UK.  2Department of Biological Sciences, Xi’an Jiaotong-Liverpool University (XJTLU), Suzhou, China.  The lack of an identifiable intermediate host species for the proximal animal ancestor of SARS-CoV-2 and the distance (~1500 km) from Wuhan to Yunnan province, where the closest evolutionary related coronaviruses circ...",
    "publicationTitle": "Genome Biology and Evolution",
    "volume": "14",
    "issue": "2",
    "pages": "1-14",
    "date": "2022",
    "series": "",
    "seriesTitle": "",
    "seriesText": "",
    "journalAbbreviation": "",
    "language": "en-US",
    "DOI": "10.1093/gbe/evac018",
    "ISSN": "",
    "shortTitle": "",
    "url": "https://virological.org/t/exploring-the-natural-origins-of-sars-cov-2/595",
    "accessDate": "2021-01-17T18:26:08Z",
    "archive": "",
    "archiveLocation": "",
    "libraryCatalog": "",
    "callNumber": "",
    "rights": "",
    "extra": "Downloaded from https://academic.oup.com/gbe/article/14/2/evac018/6524630 by guest on 26 April 2024",
    "tags": [],
    "collections": [
      "DZKBQXJR"
    ],
    "relations": {
      "owl:sameAs": "http://zotero.org/groups/2446996/items/I75HHU4L"
    },
    "dateAdded": "2024-03-06T17:24:38Z",
    "dateModified": "2024-04-26T20:19:35Z"
  }
}
```

### Literature Records by Type

The tracked metadata was used to list the kinds of content included in the Bat Literature Corpus. 

The follow bash script was used to generated the content type frequency table below.

```bash
cat\
 <(echo count contentType)\
 <(preston ls --anchor hash://md5/be692b93a8edde4c4269be9e7d4ec1d7 --algo md5 | grep items? | grep hasVersion | preston cat | jq --raw-output '.[].data.itemType' | sort | uniq -c | sort -nr)\
 | mlr --ipprint --omd cat 
```

Note that there's roughly two kinds of content: top level content like journal articles, books, reports and conference papers. These top level content may have one of more association with associated content like attachments, notes, and annotations. 

| count | contentType |
| --- | --- |
| 6853 | attachment |
| 3105 | journalArticle |
| 749 | note |
| 94 | annotation |
| 71 | bookSection |
| 47 | report |
| 46 | book |
| 15 | conferencePaper |
| 9 | thesis |
| 6 | webpage |
| 5 | preprint |
| 3 | newspaperArticle |
| 3 | magazineArticle |


### Literature Record Index

Literature records can be extracted from this corpus in various ways. As an example, we show the output of an executed script in [bin/list-refs.sh](bin/list-refs.sh) again a recent version of the BatLit Corpus. For ease of processing, we've included a sample of 10 records in the table below, as well as files in tsv/csv formats include 100 records and all records.

| filenames | description |
| --- | --- |
| [refs-100.tsv](refs-100.tsv) / [refs-100.csv](refs-100.csv) | author/date/title/journal of first 100 records
| [refs.tsv](refs.tsv) / [refs.csv](refs.csv) | author/date/title/journal of all records

First 3 records shown below as an example:

| id | authors | date | title | journal | doi |
| --- | --- | --- | --- | --- | --- |
| https://www.zotero.org/groups/bat_literature_project/items/83IHB73V | Mônico \| Soto-Centeno | 02/2024 | Phylogenetic, morphological and niche differentiation unveil new species limits for the big brown bat ( <i>Eptesicus fuscus</i> ) | Royal Society Open Science | 10.1098/rsos.231384 |
| https://www.zotero.org/groups/bat_literature_project/items/NR7KIA3E | Albuja V \| Gardner \| Graves | 06/2005 | A new species of Lonchophylla Thomas (Chiroptera: Phyllostomidae) from Ecuador | Proceedings of the Biological Society of Washington | 10.2988/0006-324X(2005)118[442:ANSOLT]2.0.CO;2 |
| https://www.zotero.org/groups/bat_literature_project/items/TMKVBDSI | Alberico \| Velasco | 1991 | Description of a new broad-nosed bat from Colombia | Bonner zoologische Beiträge |  |

## Discussion
