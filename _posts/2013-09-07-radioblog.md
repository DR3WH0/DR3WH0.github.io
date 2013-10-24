---
layout: post
published: true
title: RadioBlog
category: programming
tags: lastfm jekyll github ruby webdriver twurl yaml markdown automation
description: "Ruby script for loading the free Last.Fm web radio service from the command line, tweeting recently listened tracks, and generating a Markdown formatted radio station blog post for a Jekyll site."
---

**Features**

* Load & auto-resume free [Last.fm](http://last.fm) web radio from the command line
* Tweet tracks and free MP3 downloads to [Twitter](http://twitter.com) timeline
* Generate a [Markdown](http://daringfireball.net/projects/markdown/) formatted radio station blog post for [Jekyll](http://jekyllrb.com/)

**Requirements**

* Jekyll web site ([Github Pages](http://pages.github.com/))
* [\_radioblog.rb](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb)
* [Ruby](http://www.ruby-lang.org/en/) 1.9.2 or higher
* [selenium-webdriver gem](http://rubygems.org/gems/selenium-webdriver)
* [twurl gem](http://rubygems.org/gems/twurl)
* [xml-simple gem](http://rubygems.org/gems/xml-simple)
* [googl gem](http://rubygems.org/gems/googl)
* [Firefox](http://www.mozilla.org/en-US/firefox/new/) and a [profile](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data) called 'lastfm'

**Install Instructions**

1. [Set up a 'lastfm' profile](http://dr3wh0.github.io/2013/08/17/lastfm-autoresume-part-2/) with the Firefox Profile Manager.
2. Create a [Last.fm API key](http://www.last.fm/api/account/create) and add it to the [\_config.yml](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_config.yml#L90-92) for your Jekyll site along with your Last.fm username. (You may use my key for testing purposes.)
3. [Authenticate Twurl](http://rubydoc.info/gems/twurl/0.8.3/file/README) with a Twitter API Key. You will need to set up a [Twitter Dev Application](https://dev.twitter.com/) for your account and enable it to 'Read & Write.' [Stack Overflow](http://stackoverflow.com/questions/12916539/simplest-php-example-for-retrieving-user-timeline-with-twitter-api-version-1-1/15314662#15314662) has a walk-through.
4. Place [\_radioblog.rb](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb) in the root directory of your Jekyll site.
5. Run `ruby _radioblog.rb`.
6. Push the [radio](http://dr3wh0.net/2013/09/06/kiln-radio) [station](http://dr3wh0.net/2013/09/07/thelonious-monk-radio) [post](http://dr3wh0.net/2013/09/08/chopin-radio) to your site with [git](http://dr3wh0.net/2013/08/25/git-reference) after the station has ended.

**Possible Modifications**

*This software is tailored for my personal use and may require modification beyond what is described here.*

I've installed the [SCM Music Player](http://scmplayer.net) on [DR3WH0.NET](https://github.com/DR3WH0/DR3WH0.github.io/tree/master/musicplayer), and I added some code to write free download tracks to \_config.yml for automatic playlist updates. You may want to [remove these lines](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L145-160) in the [free_download](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L109-169) function if you have no use for that feature. If want to use the SCM playlist feature on your site, see [SCM Music Player for GitHub Pages](http://dr3wh0.net/2013/08/25/scm-music-player-for-github-pages) for installation instructions.

The track tweets are not really necessary, although it takes a bit of doing to remove them. I may create NoTweet branch if there's any interest. To stop the tweets, skip step 3 of the Install Instructions and remove the following functions: [format_hash](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L48-55) & [get_tags](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L57-112). Then remove the lines of code [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L127-148), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L203-204), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L210), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L216), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L240), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L285), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L288-291), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L297-299), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L302-340), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L343), and [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L366). Whew! Almost done. Finally, remove the variables `hashtags, tweet, tcolen,` [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L114) and `@hashtags, tweet, tcolen,` [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L351) and the variable `(#{textlen})` [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L344).
Let me know if there's anything I missed or if there's a way to rubify the code to make it more modular.