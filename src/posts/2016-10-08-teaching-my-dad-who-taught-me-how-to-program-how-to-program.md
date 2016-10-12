---
layout: post
title: Teaching my dad (who taught me how to program) how to program
date: 2016-10-12 19:30:00 -04:00
published: true
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
It isn't fair to either of us for him to be unable to work without me.

I also wanted it to be something that I was very comfortable with so that when he does get stymied I can jump in fairly easily.
The first decision made was selecting SQLite as the actual storage mechanism since it's the right size tool for this job.

Sending him the documentation for SQLite got me the response below, which I felt worth a chuckle.

> "I like the first line description of sqlite (self-contained, serverless, zero-config)"

The second decision was to use a Raspberry Pi running Linux as the actual data collection and storage device.
Because of the way this machine works the data collection device needs to be always-on and keeping a serial connection between a full-size desktop workstation and the exercise machine open or dedicating an x86 server to the task of collecting data were not going to satisfy.

With all the data in a SQLite table on a Raspberry Pi, I figured it would be better to use web-based based presentation and interaction.
This avoids the problem of needing to transfer the table to another machine for interaction (backups aside) and of trying to use a non-web-based native GUI toolkit, something I haven't worked with very much at all recently.
Opting for a web GUI has the added benefit of being able to access the interface from any number of devices around the house, rather than dedicating one device to the application or building the application for the myriad target devices of the household.

Okay so we're building an application on a Linux system with a web interface, we have a data storage mechanism picked out and now we get to "pick a language".
There's few contemporary languages that lack the facility to create web views the knack here will be to select one that either we can learn together, or that I know I can teach well.
Since this is my dad's first substantial foray into programming for some time, I want to make sure it's a _fun_ experience.
He already knows that programming is as rewarding as it is challenging; Hell, he's the one who showed that to me.
But we're both busy with our own business and I wanted to make sure that like a good game, there's always momentum and new challenges.
Knowing that he wanted something akin to BASIC my first inclination was Ruby.
I know its libraries for web applications considerably well and [Sinatra's](http://sinatrarb.com) online documentation is comprehensive to an unparalleled degree among modern tools.
A primary concern was Ruby's performance on a Raspberry Pi model B but after some quick testing I was able to confirm that it would work well enough for our purposes.


## The development environment

When I was transitioning from a degree in music to one in computer science and mathematics, I dared my dad to take the introductory programming classes with me.
The nagware version of TextPad was the editor we used in those classes and it remains his primary programming editor.
Any familiarity is a victory when learning something new so the last thing I wanted to do was shake him up with a new editor just because something like Notepad++ or VS Code would be "better".
I do want to phase it in at some point, but I want to wait until TextPad is one of the things holding him back.

Since we're developing on his Windows desktop, we needed a mechanism to transfer source files from Windows to the Pi.
Given my experience, Git via SSH is a natural choice, but again, we're trying to limit the _new_ and focus on having fun making stuff so we instead use WinSCP, which he already has installed to handle sftp and scp needs for his business.
I did surreptitiously initialize a Git repository on the Pi and commit as we went so that when the time came to start using Git as the transport method, that would be set up and we'd have some history.

On the Pi itself, we installed `tmux` so that we could both SSH in and share typing responsibility.
This also keeps the data collection and web services running even when not connected to the machine via SSH without having to discuss process supervision.

We started the week before the exercise machine was due to arrive, so to test the program we connected it via null-modem cable to an RS232 serial port on the desktop and used [realterm](http://realterm.sourceforge.net/index.html) to send pre-written test data as if the desktop was the machine.

## Getting rolling...

The first night was entirely dedicated to reading and writing to the serial port from Ruby using the [rubyserial](https://github.com/hybridgroup/rubyserial) library, an FFI-based library.
We did not spend any time discussing objects, Ruby idioms, or anything that wasn't necessary to move forward.
The entire program ran in a `loop do .. end` block with case expressions and nested while loops for flow control.
It was nearly two in the morning when we were able to correctly read and decode a string of bytes from the (simulated) machine.

## The next sessions

The next few times we got together would start with questions based on he'd done in the intervening time.
These ranged from "what Ruby construct makes this work?" to "what the hell is up with this thing I found on StackOverflow?"
He figured out how to create methods (though we're still calling them "subroutines" not methods or functions) on the main object.
By the end of the weekend, we we're able to have full conversations with the simulated machine but weren't actually storing the data in the database yet.

Rather than manually create the table schema or pull in an ORM, I opted to throw together a very simple sqlite-focused migrator and database access module.
The intention was to introduce the ideas of versioned schema, Ruby blocks constructs, and method bucket modules but this proved to be a lot all at once so the explanations were very hand-wavy.
Still, our database schema is defined in versioned software so that's a win.
We whipped up a quick class to encapsulate a single workout session and store it in the database but again, did not get deep into the discussion of classes.

<hr class="notitle-break">

After that first week, my visit home ended and the exercise machine arrived.
By the time I flew home we were reading basic information about workouts from the database but in a pretty ugly way.

We still hadn't gotten into an in-depth discussion of Ruby idioms nor encapsulated any of our early work into library classes to be used later.

This post is getting long and there's more to talk about with the remote pairing, so here's as good a place as any to put the _TO BE CONTINUED_.
The important thing is that both of us are still having fun and building software that you get to interact with is ultimately fulfilling.






