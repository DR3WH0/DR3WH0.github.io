---
layout: post
published: true
title: Karma Model
category: programming
tags: karma ontologies
---

## titles-list-sample.csv

### PyTransforms
#### _aggregation_uri_
From column: _BL Record ID_
>``` python
return blAggregationUri(getValue("BL Record ID"))
```


### Semantic Types
| Column | Property | Class |
|  ----- | -------- | ----- |
| _BL Record ID_ | `dct:identifier` | `dpla:SourceResource1`|
| _Date of Publication_ | `skos:prefLabel` | `edm:TimeSpan1`|
| _Physical Description_ | `dct:format` | `dpla:SourceResource1`|
| _Place of Publication_ | `skos:prefLabel` | `edm:Place1`|
| _Publisher_ | `dct:publisher` | `dpla:SourceResource1`|
| _Title Name_ | `dct:title` | `dpla:SourceResource1`|
| _aggregation_uri_ | `uri` | `ore:Aggregation1`|


### Links
| From | Property | To |
|  --- | -------- | ---|
| `dpla:SourceResource1` | `dc:date` | `edm:TimeSpan1`|
| `dpla:SourceResource1` | `dct:spatial` | `edm:Place1`|
| `ore:Aggregation1` | `edm:aggregatedCHO` | `dpla:SourceResource1`|
| `ore:Aggregation1` | `edm:dataProvider` | `xsd:British Library`|


* [Cool URIs](http://cool.uris)
* [TCDL Karma Workshop](https://github.com/szeke/karma-tcdl-tutorial)