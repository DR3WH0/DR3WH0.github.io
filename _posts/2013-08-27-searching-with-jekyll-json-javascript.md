---
category: DR3WH0
layout: post
published: true
title: "Searching with Jekyll, JSON, & JavaScript"
tags: jekyll liquid json javascript
description: "How I added tag search results to this blog, or Standing on the Shoulders of Giants."
---

We stand on the shoulders of giants every day. A big part of learning to do anything is watching those who can do something well and then emulating that behavior. I am no expert on any of the three J's listed above, but I know enough about coding to cobble something together when the need arises.

[My last post](http://dr3wh0.net/dr3wh0/2013/08/25/scm-music-player-for-github-pages) discussed how to set up the SCM Music Player, a nice tool for embedding an mp3 player in your site. Unfortunately, it broke the ref link that jumped to the tag listing on the Tags index when clicking on a tag at the bottom of a post. Interestingly enough, writing the last post led me to [this blog](http://alexpearce.me/) that has some great Jekyll tips and tools.

One of those tools is a set of JavaScript functions that allow for dispaying Liquid tags on a Jekyll blog and setting up search pages for categories and tags, among other things that I've yet to explore.