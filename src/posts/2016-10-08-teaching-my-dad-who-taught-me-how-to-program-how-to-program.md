---
layout: post
title: Teaching my dad (who taught me how to program) how to program
date: 2016-10-08 00:28:00.000000000 -04:00
published: false
categories: []
---

I've had some extra time to spend with my family lately, and one of the things I've done with that is finally indulge my dad in collaborating on a software project.
He taught me how to program ages ago, I remember working on a PONG clone in Visual Basic in fifth grade or so but I know there were smaller projects before that.
He left the industry while I was still young and hasn't been a full-time software developer since sometime around 25ish years ago.

We've talked a few times about "the bug", that desire to get back into programming stuff, but there's a lot that's happened in computer-land since he was last writing software.
He has a particularly tough time with the operational and administrative aspects of contemporary computing, which is why I didn't want to just send him a link to http://www.qbasic.net/ and tell him to have fun.
These talks often lead to brainstorming potential projects and finally one of the projects seemed to hit the right mix of fun and achievable with our combination of expertise.

## The project

He was getting a new exercise machine, a fancy elliptical trainer, that could send workout data and receive commands over a serial connection.
The machine he was getting didn't have any native data storage or analysis tracking as adding that one was going to be super expensive, so instead we talked about ways to collect that ourselves and present it on some other screen in the household.

Choosing the technology for this project required a lot of thought.
While I had a good chunk of time set aside for one week, there was going to be continual work on this for a while and it needed to use tools he could leverage search engines and online documentation for when I was unavailable.
I also wanted it to be something that I was very comfortable with so that when he does get stymied I can jump in fairly easily.
The first decision made was selecting SQLite as the actual storage mechanism since it's the right size tool for this job.

> "I like the first line description of sqlite (self-contained, serverless, zero-config)"

The second decision was to use a Raspberry Pi running Linux as the actual data collection and storage device.
Because of the way this machine works the data collection device needs to be always-on and keeping a serial connection between a full-size desktop workstation and the exercise machine open or dedicating an x86 server to the task of collecting data were not going to satisfy.

With all the data in a SQLite table on a Raspberry Pi, I figured it would be better to use web-based based presentation and interaction.
This avoids the problem of needing to transfer the table to another machine for interaction (backups aside) and of trying to use a non-web-based native GUI toolkit, something I haven't worked with very much at all recently.
Opting for a web GUI has the added 

