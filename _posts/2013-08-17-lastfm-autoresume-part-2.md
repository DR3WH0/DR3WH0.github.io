---
category: DR3WH0
layout: post
published: true
title: LastFm AutoResume (Part 2)
tags: lastfm automation ruby selenium webdriver firefox ubuntu
description: "Instructions for auto-resuming the free Last.fm Web service with Ruby and Firefox."
---

In a [previous post](http://dr3wh0.github.io/dr3wh0/2013/07/21/LastFm-AutoResume/), I outlined a rough method for auto-resuming the free Last.fm Web service. Today I wrote a more robust auto-resume solution with Ruby and Selenium-WebDriver. This was developed on a Ubuntu 10.04 box. Your mileage with other systems may vary.

**Requirements**

* [lastfm-autoresume.rb](https://gist.github.com/DR3WH0/6259121)
* [Ruby](http://www.ruby-lang.org/en/) 1.9.2 or higher
* [selenium-webdriver gem](http://rubygems.org/gems/selenium-webdriver)
* [Firefox](http://www.mozilla.org/en-US/firefox/new/) and a [profile](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data) called 'lastfm'

**Instructions**

1. Set up your 'lastfm' Firefox profile with the Profile Manager:
    firefox -P
2. For best results with the new profile, install the [Adblock Plus](https://adblockplus.org/en/firefox) add-on, hide all toolbars, and deselect 'Always show the tab bar' in Preferences.
3. If you want to scrobble to an existing Last.fm account, log in to [Last.fm](https://last.fm/login) in the new 'lastfm' Firefox profile, remain logged in, and be sure to select 'Play music in-page' in the [Website Settings](http://www.last.fm/settings/website).

