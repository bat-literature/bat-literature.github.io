# Retiring BatLit Zenodo Deposits

The BatLit curation workflow uses Zotero to manage their literature collection. Also, when possible, these literature records are deposited as Zenodo records. As part of the curation process, Zotero records are updated, created, deduplicated and removed.

One removal of a Zotero record, their associated Zenodo deposit is considered retired. Retired Zenodo deposits are moved to the ```batlit-retired``` Zenodo community at https://zenodo.org/communities/batlit-retired . 

To list retired Zenodo deposits, Zenodo is queried for removed Zotero records and the query results are stored in ```zenodo-to-retire```,  this directory using:

``` 
bash bin/track-zenodo-deposits-to-retire.sh
```

Following, a list of Zenodo deposit record ids to be retired can be created using the following workflow:

```bash
preston ls --algo md5 --data-dir zenodo-to-retire\
 | preston cat --data-dir zenodo-to-retire\
 | jq '.["hits"] | select( .hits | length > 0) | .["hits"][0].id'
```

Following, the https://github.com/jhpoelen/zenodo-upload tools are used to:

1. remove the retired deposits from the BatLit Zenodo community at https://zenodo.org/communities/batlit
2. add the retired Zenodo deposits to the BatLit retirement community at https://zenodo.org/communities/batlit-retired .

For more information, see https://github.com/bat-literature/bat-literature.github.io/issues/114 .

