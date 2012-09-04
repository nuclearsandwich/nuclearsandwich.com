---
layout: post
title: "A Minimal Friction Workflow for First-time Contributors"
date: 2012-01-19 21:36:00 -8
published: false
comments: true
categories: Git,GitHub,Software
---

*This is but one of many.*

Preamble
--------

I was describing my standard workflow for contributing to open source projects
on GitHub last weekend when I was asked by [Walter][] to write a blog post about
the process. It's rather straightforward if you're used to git and GitHub but
the act of describing it was enough to make me realize that the whole process
and logic behind it is rather opaque to those who are new to programming, git,
or open source contribution, and want to help out.

What I describe here is by no means the One True Way (tm) as there are plenty of
equally valid workflows that others are more comfortable with. What I like best
about mine is the ease with which I can work on multiple __orthogonal__  aspects
of the same project without trying to commit around each other. This becomes a
boon against my personal tendency to rabbit hole, which I may or may not get
into later.

This Post
---------

Since I hope that this post will stand as a reference for some time, I'd like to
present it's structure up front, if it proves unnecessary once the final product
is complete, I will remove it. The entire contribution process from start to
finish is described in a step by step fashion. Each step has a *What* section,
where you are guided through the actions that must be performed, followed by the
*Why*, which is my personal reason for using and suggesting this workflow. The
amount of concrete scenarios used to describe each case will depend on necessity
and time.

Let's get started.

Step 1: Fork and Clone the Repository
=====================================

#### What ####

First, find a projecy you're interested in. Then, find a way to help. In almost
all cases, the smaller, the better for both you and your upstream maintainer.
Once you have decided what to do, fork the upstream repository on GitHub and
then clone your fork locally. For today's exercise, let's say the upstream app
is the [Railsbridge][] project [bridge_troll][] and the change I want to make is
in to turn 

``` ruby
class User
  # ...
  def skills
    SKILLS.reject do |skill|
      !send("skill_" + skill)
  end
end
```

Into

``` ruby
# app/models/user.rb
class User
  # ...
  def skills
    SKILLS.select do |skill|
      send("skill_#{skill}")
    end
  end
end
```

My GitHub username is
[nuclearsandwich][] so I will enter the following:

    git clone git@github.com:nuclearsandwich/bridge_troll.git -o github
    git remote add upstream git://github.com/railsbridge/bridge_troll.git

***Note about conventions***: As a rule, I use the remote name `github` for my fork
of a project, and the remote name `upstream` for the repository from which I
forked. I do this because it prevents me from needing to remeber the name of the
upstream account and because `github` makes more sense to me than `origin`, of
which there can be many in a git repository. If you prefer something different,
feel free to use your own conventions.

#### Why? ####

Creating your fork of the repo is a necessary step for submitting a pull request
and I like to get it out of the way early. In order to actually affect your
change, you will need a copy of the repo to work in, thus creating the local
clone. Adding the upstream repo as a remote is another preemptive housekeeping
step. While you don't *strictly* need to do it for a one-time contribution, it
becomes necessary if you will be contributing regularly or if enough time passes
between when you forked and when you're ready to submit your pull request that
new commits have been made upstream.

***Note about tracking branches***: A slight and perfectly valid variation of this
method is to clone the upstream repo and add the github remote. The sole
difference between the methods is in which repository's master branch will be
tracked by your local master. If the concept of tracking branches in Git is
unclear for you, it's perfectly fine to ignore this note.

Step 2: Create a Local Branch for Your Change
=============================================

#### What ####

Branching is one of the coolest things about git.


[Walter]: https://github.com/WalterYu
[Railsbridge]: http://railsbridge.org
[bridge_troll]: https://github.com/railsbridge/bridge_troll
[nuclearsandwich]: https://github.com/nuclearsandwich
