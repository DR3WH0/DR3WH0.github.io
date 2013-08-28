---
category: DR3WH0
layout: post
published: true
title: "Searching with Jekyll, JSON, & JavaScript"
tags: jekyll liquid json javascript
description: "How I added tag search results to this blog, or Standing on the Shoulders of Giants."
---

We stand on the shoulders of giants every day. A big part of learning to do anything is watching those who can do something well and then emulating that behavior. I am no expert on any of the three J's listed above, but I know enough about coding to cobble something together when the need arises and I can find a good model to work with.

[My last post](http://dr3wh0.net/dr3wh0/2013/08/25/scm-music-player-for-github-pages) discussed how to set up the SCM Music Player, a nice tool for embedding an mp3 player in your site. Unfortunately, it broke the #-ref link that jumped to the tag listing on the Tags index when clicking on a tag at the bottom of a post. Interestingly enough, writing the last post on SCM led me to [this blog](http://alexpearce.me/) that has some great Jekyll tips and tools and a solution to the tag link problem.

One of those tools is a [set of JavaScript functions](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/javascripts/liquidescape.js) that allow for dispaying Liquid tags on a Jekyll blog, setting up search pages for categories and tags, and other things that I've yet to explore. I implemented the [Liquid tag escape](http://alexpearce.me/2012/04/escaping-liquid-tags-in-jekyll/) with a bit of modification to the [replaceERBTags function call](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/javascripts/liquidescape.js#L159) to match this site's html, and I'll briefly explain how I set up [tag search results](http://alexpearce.me/2012/04/simple-jekyll-searching/).

In addition to the JavaScript suite linked above, I grabbed [search.json](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/search.json), [\_includes/post.json](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_includes/post.json), and [search.html](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/search.html#L7). The first two files populate the third file with customized results from <http://DR3WH0.net/search.json> when a GET request is made with the custom JavaScript.

As highlighted in 'search.html', I changed the \<h1> tag to an \<h2> to match the rest of the site. That necessitated a [change here](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/javascripts/liquidescape.js#L84) to look for the right tag to print the page title. Finally, I modified the URL creator in [\_includes/JB/tags_list](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_includes/JB/tags_list#L25) to point to the right search results page when a tag box is clicked in a post.

That got the search results working, but I missed the tooltip descriptions that appear when hovering above a post link elsewhere in the site. I added a description field to post.json and slightly modified the JavaScript code to include a title attribute in the \<a> tag. Also be sure to include the JavaScript file somewhere on your [default layout](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_layouts/default.html#L49).