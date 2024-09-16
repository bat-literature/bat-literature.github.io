The Bat Literature Project (BatLit) facilitates discovery of scientific literature on bats (Chiroptera).

by Aja C. Sherman (curator, batbase.org), Jorrit H. Poelen (reviewer, archivist), Donat Agosti (reviewer, Plazi), Cullen K. Geiselman (reviewer, batbase.org), [your name here]

with contributions from DeeAnn Reeder, Nancy Simmons, Kendra Phelps, ...

⚠️ this is a work in progress⚠️

[Introduction](#introduction) / [Methods](#methods) / [Prerequisites](#prerequisites) / [Results](#results) / [Discussion](#Discussion)

If you'd like to explore BatLit, please review the examples below. Alternatively, if you'd like to learn more about why BatLit exists, and how it was built, please skip to the [`Introduction`](#introduction).

### Example: Text Search 

BatLit can be searched and discovered through Zenodo at https://zenodo.org/communities/batlit. Zenodo offers powerful search features through a point-and-click web interface.  

For instance, let's say that Carla would like to search for literature that mention "Rhinolophus sinicus" in their associated metadata (e.g., title, abstract). She uses Zenodo and enters "Rhinolophus sinicus" in the search box of the BatLit community producing the following query: [https://zenodo.org/communities/batlit/records?q=rhinolophus%20sinicus](https://zenodo.org/communities/batlit/records?q=rhinolophus%20sinicus) . On inspecting the initial results, she limits to see only publications that are openly available by selecting `Access Status > Open` in the Zenodo web search results. 

[![search dropdown](assets/zenodo-search.png)](https://zenodo.org/communities/batlit/records?q=rhinolophus%20sinicus)

[![results](assets/zenodo-results.png)](https://zenodo.org/communities/batlit/records?q=rhinolophus%20sinicus)

### Example: Web Search For Specific Zotero Record

BatLit is managed in Zotero. Each Zotero record has a group id and an item id. These ids are unique identifiers for a record. The ids are used to create a life science identifier for each literature record with the following syntax:

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
preston cat --remote https://linker.bio hash://md5/26f7ce5dd404e33c6570edd4ba250d20\
 | grep "items[?]"\
 | grep hasVersion\
 | preston cat --remote https://linker.bio\
 | jq -c '.[]'\
 | jq --raw-output -c '.data | select(has("creators"))'\
 | wc -l
```

Estimating number of associated corpus pdfs - 

```
preston cat --remote https://linker.bio hash://md5/26f7ce5dd404e33c6570edd4ba250d20\
 | grep "file/view"\
 | grep hasVersion\
 | grep hash\
 | wc -l
```

Estimating the total volume of data for the most recent (i.e. "head") version

```
preston cat --remote https://linker.bio hash://md5/26f7ce5dd404e33c6570edd4ba250d20\
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
preston cat --remote https://linker.bio hash://md5/26f7ce5dd404e33c6570edd4ba250d20\
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
  "key": "NYT92CCF",
  "version": 48777,
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
      "href": "https://api.zotero.org/groups/5435545/items/NYT92CCF",
      "type": "application/json"
    },
    "alternate": {
      "href": "https://www.zotero.org/groups/bat_literature_project/items/NYT92CCF",
      "type": "text/html"
    },
    "attachment": {
      "href": "https://api.zotero.org/groups/5435545/items/3MVRRMR8",
      "type": "application/json",
      "attachmentType": "application/pdf",
      "attachmentSize": 388576
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
    "creatorSummary": "Thong et al.",
    "parsedDate": "2010-10-14",
    "numChildren": 1
  },
  "data": {
    "key": "NYT92CCF",
    "version": 48777,
    "itemType": "journalArticle",
    "title": "Further records of Murina tiensa from Vietnam with first information on its echolocation calls.",
    "creators": [
      {
        "creatorType": "author",
        "firstName": "Vu Dinh",
        "lastName": "Thong"
      },
      {
        "creatorType": "author",
        "firstName": "Christian",
        "lastName": "Dietz"
      },
      {
        "creatorType": "author",
        "firstName": "Annette",
        "lastName": "Denzinger"
      },
      {
        "creatorType": "author",
        "firstName": "Paul J. J.",
        "lastName": "Bates"
      },
      {
        "creatorType": "author",
        "firstName": "Neil M.",
        "lastName": "Furey"
      },
      {
        "creatorType": "author",
        "firstName": "Gabor",
        "lastName": "Csorba"
      },
      {
        "creatorType": "author",
        "firstName": "Glenn",
        "lastName": "Hoye"
      },
      {
        "creatorType": "author",
        "firstName": "Le Dinh",
        "lastName": "Thuy"
      },
      {
        "creatorType": "author",
        "firstName": "Hans-Ulrich",
        "lastName": "Schnitzler"
      }
    ],
    "abstractNote": "The fairy tube-nosed bat, Murina tiensa, is considered to be endemic to Vietnam. It is known only from the original description, when it was found at two localities in limestone karst areas. In 2008, we conducted a series of intensive field surveys throughout the country and obtained additional records of this species from various habitats, including degraded to nearly pristine forests and an offshore island. Our results indicate that M. tiensa is a sexually dimorphic species, females being considerably larger than males in all external and craniodental measurements. The species emits broadband, downward frequency-modulated echolocation calls with a dominant first harmonic. When handheld or when flying in a flight tent, signals had a similar structure and were emitted in groups of 2–4 signals. On average, signals swept from 150 to 49 kHz in 2.2 ms for handheld bats, and, from 145 to 50 kHz in 1.9 ms for flying bats. M. tiensa often occurred in sympatry with M. cyclotis and several rhinolophids.",
    "publicationTitle": "Hystrix, the Italian Journal of Mammalogy",
    "volume": "22",
    "issue": "1",
    "pages": "",
    "date": "October 14, 2010",
    "series": "",
    "seriesTitle": "",
    "seriesText": "",
    "journalAbbreviation": "",
    "language": "en",
    "DOI": "10.4404/hystrix-22.1-4533",
    "ISSN": "18255272, 03941914",
    "shortTitle": "",
    "url": "https://doi.org/10.4404/hystrix-22.1-4533",
    "accessDate": "2024-06-28T00:31:16Z",
    "archive": "",
    "archiveLocation": "",
    "libraryCatalog": "DOI.org (CSL JSON)",
    "callNumber": "",
    "rights": "",
    "extra": "",
    "tags": [],
    "collections": [
      "UAWY6DNP"
    ],
    "relations": {
      "dc:replaces": "http://zotero.org/groups/5435545/items/NF6R8YCX"
    },
    "dateAdded": "2024-07-08T02:34:45Z",
    "dateModified": "2024-08-16T13:50:15Z"
  }
}
```

### Literature Records by Type

The tracked metadata was used to list the kinds of content included in the Bat Literature Corpus. 

The follow bash script was used to generated the content type frequency table below.

```bash
cat\
 <(echo count contentType)\
 <(preston cat --remote https://linker.bio hash://md5/26f7ce5dd404e33c6570edd4ba250d20 | grep items? | grep hasVersion | preston cat --remote https://linker.bio | jq --raw-output '.[].data.itemType' | sort | uniq -c | sort -nr)\
 | mlr --ipprint --omd cat 
```

Note that there's roughly two kinds of content: top level content like journal articles, books, reports and conference papers. These top level content may have one of more association with associated content like attachments, notes, and annotations. 

| count | contentType |
| --- | --- |
| 31162 | attachment |
| 19300 | journalArticle |
| 759 | note |
| 358 | book |
| 254 | bookSection |
| 96 | annotation |
| 95 | report |
| 52 | thesis |
| 32 | conferencePaper |
| 21 | preprint |
| 15 | dataset |
| 9 | magazineArticle |
| 4 | webpage |
| 3 | newspaperArticle |
| 2 | presentation |

### Literature Record Index

Literature records can be extracted from this corpus in various ways. As an example, we show the output of an executed script in [bin/list-refs.sh](bin/list-refs.sh) again a recent version of the BatLit Corpus. For ease of processing, we've included a sample of 10 records in the table below, as well as files in tsv/csv formats include 100 records and all records.

| filenames | description |
| --- | --- |
| [refs-100.tsv](refs-100.tsv) / [refs-100.csv](refs-100.csv) | author/date/title/journal of first 100 records
| [refs.tsv](refs.tsv) / [refs.csv](refs.csv) | author/date/title/journal of all records

First 3 records shown below as an example:

| id | authors | date | title | journal | doi |
| --- | --- | --- | --- | --- | --- |
| https://www.zotero.org/groups/bat_literature_project/items/NYT92CCF | Thong \| Dietz \| Denzinger \| Bates \| Furey \| Csorba \| Hoye \| Thuy \| Schnitzler | October 14, 2010 | Further records of Murina tiensa from Vietnam with first information on its echolocation calls. | Hystrix, the Italian Journal of Mammalogy | 10.4404/hystrix-22.1-4533 |
| https://www.zotero.org/groups/bat_literature_project/items/H7NRHKNW | Kruszynski \| Bailey \| Bach \| Bach \| Fritze \| Lindecke \| Teige \| Voigt | 03/2022 | High vulnerability of juvenile Nathusius’ pipistrelle bats (Pipistrellus nathusii) at wind turbines | Ecological Applications | 10.1002/eap.2513 |
| https://www.zotero.org/groups/bat_literature_project/items/STHPDEVX | Swinhoe | 01/1862 | ON THE MAMMALS OF THE ISLAND OF FORMOSA (CHINA). By R. SwINHOE, EsQ., F.R.S., H.M. VICE-CONSUL AT FORMOSA. | Proceedings of the Zoological Society of London | 10.1111/j.1469-7998.1862.tb06539.x |

## Discussion
