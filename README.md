The Bat Literature Project aims to facilitate discovery of scientific literature on bats (Chiroptera).

⚠️ this is a work in progress⚠️

[Introduction](#introduction)
[Methods](#methods)
[Results](#results)
[Discussion](#Discussion)

## Version History

 | name | version | date | size | # references | # pdfs | fingerprint |
 | --- | --- | --- | --- | --- | --- | --- | --- |
 | Bat Literature Corpus | v0.1 | 2024-04-26 | 7.9 GiB | 5055 | 2929 | [hash://sha256/6ba...189](https://linker.bio/hash://sha256/6ba3d79cf1fd6349012cb4e527b6727b3e41e140489fa9c02f132e2cdd88d189) |  

## Introduction

## Methods

We use [Zotero](https://zotero.org) for managing our literature corpus, and [Preston](https://github.com/bio-guoda/preston) for tracking their associated content in a versioned corpus. This versioned corpus is designed to be published through various channels such as local storage media (e.g., external harddisk), GitHub pages and Zenodo.


```
(Bat Literature Zotero Group) -[:track]-> (Bat Literature Corpus) 

(Bat Literature Corpus) -[:publish]-> (https://bat-literature.github.io)

(Bat Literature Corpus) -[:publish]-> (Zenodo BLR)
```

### tracking 

To track the Zotero group and compile a version of the bat literature corpus, the following command is used (in bash/linux):

```bash
ZOTERO_TOKEN=[SECRET] preston track https://www.zotero.org/groups/5435545/bat_literature_project
```

Note that this group has access restrictions for copyright reasons. This is why you need to replace the "[SECRET]" with your personal access token.

### publish metadata

To publish the batlit metadata only (not pdfs), use the following commands

```
# first copy provenance index
preston cp --type provindex [target dir]/data

# then copy the provenance 
preston cp --type prov [target dir]/data

cd [target dir]

# and get the associated zotero metadata
preston ls\
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat --remote file://[source dir]/data\
 > /dev/null
```

### Statistics

Estimating number of references in a corpus version - 

```
preston head\
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
preston head\
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
preston head\
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

### Literature Record Index

Literature records can be extracted from this corpus in various ways. As an example, we show the output of an executed script in [bin/list-refs.sh](bin/list-refs.sh) again a recent version of the BatLit Corpus. For ease of processing, we've included a sample of 10 records in the table below, as well as files in tsv/csv formats include 100 records and all records.

| filenames | description |
| --- | --- |
| [refs-100.tsv](refs-100.tsv) / [refs-100.csv](refs-100.csv) | author/date/title/journal of first 100 records
| [refs-100.tsv](refs.tsv) / [refs.csv](refs.csv) | author/date/title/journal of all records

First 10 records shown below as an example:

| authors | date | title | journal |
| --- | --- | --- | --- |
| Lytras \| Hughes \| Martin \| Swanepoel \| de Klerk \| Lourens \| Kosakovsky Pond \| Xia \| Jiang \| Robertson | 2022 | Exploring the natural origins of SARS-CoV-2 | Genome Biology and Evolution |
| Crichton \| Krutzsch |  | Reproductive Biology of Bats |  |
| Callaway | 2023-06-27 | Trove of new coronaviruses uncovered in bats — but threat is unclear | Nature |
| MooreNov |  | Is the debate over the origin of Covid-19 still worth having? |  |
| Straka \| Coleman \| Macdonald \| Kingston | 10/2021 | Human dimensions of bat conservation – 10 recommendations to improve and diversify studies of human-bat interactions | Biological Conservation |
| Goodman \| Jenkins \| Ratrimomanarivo | 2005 | A review of the genus Scotophilus (Mammalia, Chiroptera, Vespertilionidae) on Madagascar, with the description of a new species | Zoosystema |
| Murray \| Barnett | 1976 | Biology of Bats of the New World Family Phyllostomatidae. Part I | Texas Tech Press |
| Peters | 1996 | Cardioderma cor | Mammalian Species |
| Ski \| Kimmel | 2003 | Population genetics models for the statistics of DNA samples under different demographic scenarios - Maximum likelihood versus approximate methods | International Journal of Applied Mathematics and Computer Science |
| Freeman | 1998 | Form, Function, and Evolution in Skulls and Teeth of Bats |  |

## Discussion
