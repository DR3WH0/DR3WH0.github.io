---
layout: post
published: true
title: SCM Music Player for GitHub Pages
category: programming
tags: music javascript liquid yaml github
description: "Instructions for installing the SCM Music Player on GitHub Pages. Includes code for generating playlists with Liquid & YAML."
---

Stumbled upon a cool gadget called the [SCM Music Player](http://scmplayer.net/) that I just added to the site. The default install is remotely hosted, but I chose to install locally on GitHub Pages to take advantage of Liquid & YAML for easy playlist editing.

**Local GitHub Pages Install**

Just clone the [SCM-Music-Player](https://github.com/cshum/SCM-Music-Player) repository to a folder in your site. I downloaded a ZIP file, dragged the folder to to the site repo on my local machine, renamed the folder as [musicplayer](https://github.com/DR3WH0/DR3WH0.github.io/tree/master/musicplayer), and pushed the changes with [git](http://dr3wh0.net/2013/08/25/git-reference).

In a web browser, navigate to the SCM Player's index.html page on your site (in my case <http://dr3wh0.net/musicplayer/index.html>) and walk through the setup wizard. When you're finished, paste the [widget code](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_includes/scm.html) in your [default layout](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_layouts/default.html#L7) as directed by the setup wizard.

**Optional Liquid Playlists**

The Javascript for the playlists can get a bit unwieldy, and I don't want to walk through the SCM wizard to get new code every time I want change up the tracks. Liquid & YAML to the rescue!

Replace the SCM wizard's playlist code with the Liquid code below. If you want to use the playlist generated with the SCM wizard, be sure to save that code somewhere. I've broken up the Liquid into logical chunks for readability, but you should put all of the code [on one line](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_includes/scm.html#L3) at the end of the `data-config` attribute.

    'playlist':[
      <% for track in site.tracks %>
        {'title':'<%= track.name %>','url':'<%= track.url %>'}
        <% unless forloop.last %>,<% endunless %>
      <% endfor %>]

Next you'll need to create the track data with YAML tags in [\_config.yml](https://github.com/DR3WH0/DR3WH0.github.io/blob/master/_config.yml#L94-96). Use the following template to manage the playlist, reformatting any of the data you saved from the widget setup:

    tracks :
      - name : track_name_here
        url : song_url_here

Add new `name` and `url` lines for each track. Be sure to include the dash, as indicated above, before each `name` because Liquid uses that to identify each track in the `<% for track in site.tracks %>` loop. SCM Player supports URLs for MP3, SoundCloud, and YouTube.

**Further Reading**

You can read more about the [history of the project](http://cshum.com/2013/01/behind-the-scenes-scm-music-player/) and some [thoughts on Javascript](http://cshum.com/2013/01/my-summary-on-javascript/) on the SCM Music Player creator's blog. He recommends Douglas Crockford's [JavaScript: The Good Parts](https://dl.dropboxusercontent.com/u/8239797/javascript_the_good_parts.pdf) if you really want to dig in.