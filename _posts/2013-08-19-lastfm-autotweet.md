---
category: DR3WH0
layout: post
published: true
title: LastFm AutoTweet
tags: lastfm twitter automation ruby twurl
description: Ruby script for automatically tweeting listened tracks from the free Last.fm radio service.
---

Building on [LastFM AutoResume](http://dr3wh0.github.io/dr3wh0/2013/08/17/lastfm-autoresume-part-2/), I wrote another Ruby script to automatically post recently listened tracks to Twitter.

**Requirements**

* [lastfm-autotweet.rb](https://gist.github.com/DR3WH0/6268055#file-lastfm-autotweet-rb)
* [lastfm-autotweet.yaml](https://gist.github.com/DR3WH0/6268055#file-lastfm-autotweet-yaml)
* [Ruby](http://www.ruby-lang.org/en/) 1.9.2 or higher
* [selenium-webdriver gem](http://rubygems.org/gems/selenium-webdriver)
* [twurl gem](http://rubygems.org/gems/twurl)
* [xml-simple gem](http://rubygems.org/gems/xml-simple)
* [googl gem](http://rubygems.org/gems/googl)
* [Firefox](http://www.mozilla.org/en-US/firefox/new/) and a [profile](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data) called 'lastfm'

**Command Line**

	ruby lastfm-autotweet.rb

**Instructions**

1. See [this post](http://dr3wh0.github.io/dr3wh0/2013/08/17/lastfm-autoresume-part-2/) for instructions on setting up a Firefox 'lastfm' profile with the Profile Manager.
2.