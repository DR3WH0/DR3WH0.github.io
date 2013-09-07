---
layout: post
published: true
title: RadioBlog
category: programming
tags: lastfm twitter jekyll github ruby webdriver twurl yaml markdown automation
description: "Ruby script for loading the free Last.Fm web radio service from the command line, tweeting recently listened tracks, and generating a Markdown formatted radio station blog post for a Jekyll site."
---

**Features**

* Load & auto-resume free [Last.Fm](http://last.fm) web radio from the command line
* Tweet recent tracks to [Twitter](http://twitter.com) timeline
* Generate a [Markdown](http://daringfireball.net/projects/markdown/) formatted radio station blog post for [Jekyll](http://jekyllrb.com/)

**Requirements**

* Jekyll web site ([Github Pages](http://pages.github.com/) has free hosting)
* [\_radioblog.rb](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb)
* [Ruby](http://www.ruby-lang.org/en/) 1.9.2 or higher
* [selenium-webdriver gem](http://rubygems.org/gems/selenium-webdriver)
* [twurl gem](http://rubygems.org/gems/twurl)
* [xml-simple gem](http://rubygems.org/gems/xml-simple)
* [googl gem](http://rubygems.org/gems/googl)
* [Firefox](http://www.mozilla.org/en-US/firefox/new/) and a [profile](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data) called 'lastfm'

**Install Instructions**

1. [Set up a 'lastfm' profile](http://dr3wh0.github.io/2013/08/17/lastfm-autoresume-part-2/) with the Firefox Profile Manager.
2. Create a [Last.fm API key](http://www.last.fm/api/account/create) and add it to the [\_config.yml](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_config.yml#L90-92) for your Jekyll site along with your Last.fm username.
3. [Authenticate Twurl](http://rubydoc.info/gems/twurl/0.8.3/file/README) with a Twitter API Key. You will need to set up a [Twitter Dev Application](https://dev.twitter.com/) for your account and enable it to 'Read & Write.' [Stack Overflow](http://stackoverflow.com/questions/12916539/simplest-php-example-for-retrieving-user-timeline-with-twitter-api-version-1-1/15314662#15314662) has a walk-through.
4. Place [\_radioblog.rb](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb) in the root directory of your Jekyll site.
5. Run `ruby _radioblog.rb`.
6. Push changes to your site with [git](http://dr3wh0.net/2013/08/25/git-reference) after the station has ended.

**Possible Modifications**

*This software is tailored for my personal use and may require modification beyond what is described here.*

I've installed the [SCM Music Player](http://scmplayer.net) on [DR3WH0.NET](https://github.com/DR3WH0/DR3WH0.github.io/tree/master/musicplayer), and I added some code to write free download tracks to \_config.yml for instant playlist updates. You may want to [remove these lines](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L145-160) in the free_download function if you have no use for that feature. If want to use the SCM Music Player automatic playlist feature on your site, see [SCM Music Player for GitHub Pages](http://dr3wh0.net/2013/08/25/scm-music-player-for-github-pages) for installation instructions.

The track tweet functionality is not integral to the software. You can skip step 3 of the Install Instructions and safely remove the following functions: [format_hash](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L43-50) & [get_tags](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L52-107). Then remove the lines of code [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L122-143), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L197-199), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L205), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L211), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L235), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L274), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L277-280), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L286-288), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L291-329), [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L332), and [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L355). Whew! Almost done. Finally, remove the variables `hashtags, tweet, tcolen,` [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L109) and `@hashtags, tweet, tcolen,` [here](https://github.com/DR3WH0/RadioBlog/blob/master/_radioblog.rb#L340).
Let me know if there's anything I missed or if there's a way to rubify the code to make it more modular.