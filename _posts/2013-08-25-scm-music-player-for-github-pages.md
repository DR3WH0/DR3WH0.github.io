---
category: DR3WH0
layout: post
published: true
title: SCM Music Player for GitHub Pages
tags: music javascript liquid yaml github
description: "Instructions for installing the SCM Music Player on GitHub Pages. Includes code for generating playlists with Liquid & YAML."
---

Stumbled upon a cool little gadget called the [SCM Music Player](http://scmplayer.net/) that I just added to the site. The default install is remotely hosted, but I chose to install locally on GitHub Pages to take advantage of Liquid & YAML for easy playlists.

**GitHub Pages Install**

Just clone the [SCM-Music-Player](https://github.com/cshum/SCM-Music-Player) repository to a folder in your site. I downloaded a ZIP file, dragged the folder to to the site repo on my local machine, renamed the folder as [musicplayer](https://github.com/DR3WH0/DR3WH0.github.io/tree/master/musicplayer), and pushed the changes with [git](http://dr3wh0.github.io/dr3wh0/2013/08/25/git-reference).

In a web browser, navigate to the SCM Player's index.html page on your site (in my case <http://dr3wh0.github.io/musicplayer/index.html>) and walk through the setup wizard. When you're finished, paste the widget code in your [default layout](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_layouts/default.html) as directed by the setup wizard.

**Optional Liquid Playlists**

The Javascript for the playlists can get a bit unwieldy, and I didn't want to walk through the SCM wizard to get new code every time I wanted to make a change. Liquid & YAML to the rescue!

Replace the playlist code in the default layout with the Liquid code below. If you want to save the playlist you created with the SCM wizard, be sure to save that code somewhere. I've broken up the Liquid into logical chunks for readability, but you should put all of the code on one line at the end of the SCM script's config attribute.

    'playlist':[
      <% for track in site.tracks %>
        {'title':'<%= track.name %>','url':'<%= track.url %>'}
        <% unless forloop.last %>,<% endunless %>
      <% endfor %>]

Next you'll need to create your playlist with YAML tags in [\_config.yml](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_config.yml). Use the following template to record your playlist:

    tracks:
      - name:
        url:

Add new _name:_ and _url:_ lines for each track. Be sure to include the dash, as indicated above, before each _name:_ because Liquid uses that to identify each new track in the for loop. SCM Player supports URLs for MP3, SoundCloud, and YouTube.

**Further Reading**

You can read more about the [history of the project](http://cshum.com/2013/01/behind-the-scenes-scm-music-player/) and some [thoughts on Javascript](http://cshum.com/2013/01/my-summary-on-javascript/) on the SCM Music Player creator's blog. He recommends Douglas Crockford's [JavaScript: The Good Parts](https://dl.dropboxusercontent.com/u/8239797/javascript_the_good_parts.pdf) if you really want to dig in.