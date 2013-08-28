---
category: DR3WH0
layout: post
published: true
title: LastFm AutoResume (Part 2)
tags: lastfm automation ruby selenium webdriver firefox ubuntu music
description: "Instructions for auto-resuming the free Last.fm Web service with Ruby and Firefox."
---

In a [previous post](http://dr3wh0.github.io/dr3wh0/2013/07/21/LastFm-AutoResume/), I outlined a rough method for auto-resuming the free Last.fm Web service. Today I wrote a more robust auto-resume solution with Ruby and Selenium-WebDriver. This was developed on a Ubuntu 10.04 box. Your mileage with other systems may vary.

**Requirements**

* [lastfm-autoresume.rb](https://gist.github.com/DR3WH0/6259121#file-lastfm-autoresume-rb)
* [Ruby](http://www.ruby-lang.org/en/) 1.9.2 or higher
* [selenium-webdriver gem](http://rubygems.org/gems/selenium-webdriver)
* [Firefox](http://www.mozilla.org/en-US/firefox/new/) and a [profile](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data) called 'lastfm'

**Command Line**

Firefox Profile Manager:

	firefox -P
    
LastFm AutoResume:

	ruby lastfm-autoresume.rb

**Instructions**

1. Create your 'lastfm' Firefox profile with the Profile Manager.
2. For best results with the new profile, install the [Adblock Plus](https://adblockplus.org/en/firefox) add-on, hide all toolbars, and deselect 'Always show the tab bar' in Preferences > Tabs.
3. If you want to scrobble to an existing Last.fm account, log in to [Last.fm](https://www.last.fm/login) in the new 'lastfm' profile, remain logged in (i.e. don't click the Logout link), and be sure to select 'Play music in-page' in the [Website Settings](http://www.last.fm/settings/website).
4. After setting up the 'lastfm' profile, quit Firefox and switch back to the default profile with the Profile Manager.
5. Run the lastfm-autoresume.rb script. Place the script in your home folder or somewhere on your path for easiest use.
6. Enter the name of the station you want to listen to. This can be an Artist, Tag, or Track name.
7. Enter 'quit' when you want to end the AutoResume script. Last.fm will continue to play in the browser.

Give me a shout [here](http://www.last.fm/user/DR3WH0), or [here](https://gist.github.com/DR3WH0/6259121#file-lastfm-autoresume-rb), or leave a [comment](http://dr3wh0.github.io/guestbook.html) if you find this useful.

Update (2013-08-23): There is a "we collect data" privacy nag that shows up in Firefox until you dismiss it, including for each new profile. Be sure to dismiss that dialog by clicking the CHOOSE button with the 'lastfm' profile loaded in the Profile Manager. Otherwise it will appear every time you run LastFm AutoResume.