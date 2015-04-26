---
layout: post
published: true
title: Karma Model
category: programming
tags: karma ontologies
---

## titles-list-sample.csv

### PyTransforms

### Semantic Types
| Column | Property | Class |
|  ----- | -------- | ----- |
| _BL Record ID_ | `dct:identifier` | `dpla:SourceResource1`|
| _Date of Publication_ | `skos:prefLabel` | `edm:TimeSpan1`|
| _Physical Description_ | `dct:format` | `dpla:SourceResource1`|
| _Place of Publication_ | `skos:prefLabel` | `edm:Place1`|
| _Publisher_ | `dct:publisher` | `dpla:SourceResource1`|
| _Title Name_ | `dct:title` | `dpla:SourceResource1`|


### Links
| From | Property | To |
|  --- | -------- | ---|
| `dpla:SourceResource1` | `dc:date` | `edm:TimeSpan1`|
| `dpla:SourceResource1` | `dct:spatial` | `edm:Place1`|


* http://cool.uris