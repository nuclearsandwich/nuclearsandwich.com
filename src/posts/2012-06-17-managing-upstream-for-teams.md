---
layout: post
title: "Managing Upstream for Teams of One or More"
date: 2012-06-17 4:30
comments: true
published: false
categories: best-practices software-engineering archlinux
---

Anyone who's worked with me in a technical capacity has probably been bothered
by the fact that I run [Arch Linux](http://archlinux.org). This is a blog and
not a trashy romance novel so I'm not going to gush (a lot) about how much I
love Arch. But the Arch way has caused me to have some pretty severe and
unpopular opinions about how to manage a software project with upstream tools.

Always Update Everything Always
-------------------------------

Once upon a time Lisa Hacker started a new Rails project. Rails 3.1 was
installed on her computer but she was smart and decided to check and as fate
would have it, Rails 3.2 had since been released. So she updated her local
installation of Rails and checked out the change history to see the notable
differences. Then she typed `rails new awesomenessandwin` and started hacking.
Three weeks later Rails 3.3 was released and she didn't do anything about it for
her awesomenessandwin project. Shame Lisa, shame.

As engineers, we're generally decent about starting green field development with
state of the art tools. One thing we *suck* at is keeping our existing projects
at the cutting edge as well.

### It's Actually Easier This Way, Trust Me ###

One of the things I marvelled at when I switched from Slackware to Archlinux, I
balked at the notion that Arch wanted me to update it all the damn time. "Don't
they have any idea how time consuming and painful updates are? I don't want to
do that every *week*, let a lone every day." Well, as it turns out, those
Archers were on to something because when you upgrade everything all time it's
extremely rare for a change to require human intervention at either the system
or application level. And what's more, and the real true benefit to viciously
eager upgrades is that all the time-sensitive community information is actually
relevant to what you're doing. Changelogs are fresh. People on the mailing list
are going through the exact same situations, having the same problems, the same
questions, that you are! You didn't even have to wade through the icky tar that
is a Google Group archive to find someone reporting on that bug you're having
because it is the most recent thread.  Everyone on Twitter is warning you that
the latest update to WhateverDB requires a slight change in the default config
if you're operating system doesn't have a sophisticated way to negotiate that.
(You could check out Archlinux to fix that.) And most importantly, you can
provide immediate feedback to developers when they actually care about it. I
can't remember the last time I tried to report a bug in an outdated version of
something and the developer didn't ask me "Can you reproduce it in the latest
version". With a few critical exceptions developers don't want to support old
versions of stuff. They want to focus on progress and moving the current version
forward. That makes bugs in old versions of software officially *your* problem.
Use new stuff.

Go to Eleven, Use Pre-release In Development
--------------------------------------------

This is where I expect the most recoil.


How Can We Actually Do This Insane Thing
----------------------------------------

Let's say your team has *N* developers and you're using *M* upstream libraries.
By the way, in most cases, your programming language counts as an upstream
library. List each upstream and then have each developer N[i] select an upstream
M[j] that they are interested in. If you run through all your developers, keep
going around until all upstreams are selected. So if I was a developer and I
selected 
