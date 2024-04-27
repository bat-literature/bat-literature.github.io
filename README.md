The Bat Literature Project aims to facilitate discovery of scientific literature on bats (Chiroptera).

⚠️ this is a work in progress⚠️

## versions

 | name | version | date | size | # references | # pdfs | fingerprint |
 | --- | --- | --- | --- | --- | --- | --- | --- |
 | Bat Literature Corpus | v0.1 | 2024-04-26 | 7.9 GiB | 5055 | 2929 | [hash://sha256/6ba...189](https://linker.bio/hash://sha256/6ba3d79cf1fd6349012cb4e527b6727b3e41e140489fa9c02f132e2cdd88d189) |  
 
## workflow 

We use [Zotero](https://zotero.org) for managing our literature corpus, and [Preston](https://github.com/bio-guoda/preston) for tracking their associated content in a versioned corpus. This versioned corpus is designed to be published through various channels such as local storage media (e.g., external harddisk), GitHub pages and Zenodo.


```
(Bat Literature Zotero Group) -[:track]-> (Bat Literature Corpus) 

(Bat Literature Corpus) -[:publish]-> (https://bat-literature.github.io)

(Bat Literature Corpus) -[:publish]-> (Zenodo BLR)
```

## Methods

### tracking 

To track the Zotero group and compile a version of the bat literature corpus, the following command is used:

```
ZOTERO_TOKEN=[SECRET] && preston track https://www.zotero.org/groups/5435545/bat_literature_project
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


