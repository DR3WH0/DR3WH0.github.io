---
category: DR3WH0
layout: post
published: true
title: LastFm AutoTweet
tags: lastfm twitter automation ruby twurl
description: Ruby script for automatically tweeting listened tracks from the free Last.fm radio service.
---

Building on [LastFM AutoResume](http://dr3wh0.github.io/dr3wh0/2013/08/17/lastfm-autoresume-part-2/), I wrote another Ruby script to automatically post recent tracks to Twitter. You can see it in action on my [Twitter Feed](https://twitter.com/DR3WH0). Many thanks to [statianzo](https://gist.github.com/statianzo/977704) for his Last.fm API code.

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

1. See [this post](http://dr3wh0.github.io/dr3wh0/2013/08/17/lastfm-autoresume-part-2/) for instructions on setting up a Firefox 'lastfm' profile with the Profile Manager. Your new profile will need to stay logged in to Last.fm for the tweets to work.
2. [Authenticate Twurl](http://rubydoc.info/gems/twurl/0.8.3/file/README) with a Twitter API Key. You will need to set up a [Twitter Dev Application](https://dev.twitter.com/) for your account and enable it to 'Read & Write.' There's a good write up on how to do that at [Stack Overflow](http://stackoverflow.com/questions/12916539/simplest-php-example-for-retrieving-user-timeline-with-twitter-api-version-1-1/15314662#15314662).
3. Enter your Last.fm username in 'lastfm-autotweet.yaml' and save the file.
4. Run 'lastfm-autotweet.rb', enter a station name, and enjoy uninterrupted listening with a social media twist.

As always, let me know what you think [here](https://gist.github.com/DR3WH0/6268055#file-lastfm-autotweet-yaml), or [here](http://www.last.fm/user/DR3WH0), or in the [comments](http://dr3wh0.github.io/guestbook.html).