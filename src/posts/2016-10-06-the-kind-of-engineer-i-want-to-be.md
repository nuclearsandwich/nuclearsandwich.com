---
layout: post
title: The kind of engineer I want to be
date: 2016-10-06 10:53:00 -04:00
published: true
categories: []
---

Some people make a lot of bother about the distinction between programmers, developers, and software engineers.
I don't much care to because even if you could present me with three disjoint definitions for the three terms I'm reasonably certain that none would be individually possible without the application of the other two.
Software engineers develop applications by writing programs.
Programmers solve problems applying software engineering principles.
I can shuffle all three together around to build a host of statements that all boil down to a tautology.
The kind of engineer I want to be is also the kind of programmer I want to be, but I picked the term engineer because it's the title of the position I'll be applying for at most organizations.

## I'll be collaborative.

Collaboration has been a key aspect of computing for me since childhood days making Pong clones with my dad.
I enjoy pair programming although it's been hard finding great tools for remote pairing and even harder coordinating across timezones and work schedules, so it's not the only trick in my bag.
I think pairing is most effective when there's a concrete objective and a flexible but still explicit time box.
Code review's best results come about when it is treated as an asynchronous pairing session rather than as an alternating propose/accept cycle.

Collaboration doesn't stop with my fellow engineers.
Building software collaboratively mandates empathy and respect for a project's writers, testers, administrative staff, and audience.

There's no replacement for working with people who are good at what they do.


## I'll be resilient

Bugs and mistakes are commonplace, but that doesn't subdue the frustration at stray commas and other errors as basic and more complex than that.
In my experience building software relies on momentum, which feeds on a good attitude and preys on frustration.
There's a going trend in software engineering to be disparaging of what we do and how we do it.
Satirical posts about change fatigue and even change fatigue-fatigue are featured monthly in our discourse.
I definitely frequent this place, and like to joke about chucking my laptop in the river or the fact that I periodically check the price of goats.
But those moments should pass and I can't even recount the number of times that stepping away from the computer played a crucial role in solving the problem.
One of the reasons I enjoy working remotely is that when a problem frustrates I can do the dishes, sweep the floor, pet the cat, or go out for coffee.
When I'm at an office I'll make coffee or tea, find a window and stare, or walk around the block.
I come back in and a fresh look at the problem
The first lesson I remember learning in programming was "If you can't solve the problem, then change the problem".
The nature of computing is that potential solutions reveal themselves to different statements of the problem at hand.
I periodically find myself ["rubber ducking"](https://blog.codinghorror.com/rubber-duck-problem-solving/) with the cat or just testing different expressions of the problem on paper or in an interactive scripting environment to tease out new thoughts.
Stepping away from a problem is an acknowledgement of its challenge and not an acknowledgement of defeat.


## I'll be fallible

I am definitely going to mess up.
I've introduced bugs, some silly, some nasty.
I've lost data temporarily, though thankfully not permanently.
I don't enjoy screwups but without acknowledging them I can't grow from them, and if they're going to be inevitable I might as well explain how I deal with them:

1. Identify and specify the error.
Ideally this is done in an automated fashion with software monitoring and reporting but this can sometimes only guide you toward the exact error specification.

2. Mitigate the error.
In web applications this sometimes means temporarily deploying a quick fix or if there's no apparent solution, reverting to a previous version.
I prefer to make my reverts explicit so I have a permanent record of them.
If the quick fix or revert does not halt the error, it may be necessary to jump down to the next step in order to gather more information before continuing to create a fix.

3. Determine why the error occurred and what causes it to manifest.
Errors that occur unconditionally rarely escape into production.
Find the subset of situations that manifest this error and determine what they have in common.
Knowing this commonality can sometimes be necessary to finding out exactly how to mitigate the error.

4. Resolve any long term effects of the error.
This could involve restoring information from backups or queueing failed tasks to be performed again.
If there was no long term effects, I still like to provide a quick update to the affected individuals.

5. Retrospect on how this error made it to production or release or QA or whatnot.
I'm a big fan of the [blameless post-mortem](https://codeascraft.com/2012/05/22/blameless-postmortems/), particularly the timeline of events from the introduction of the cause, to first reports of the error, through mitigation, and resolution.
This format highlights the process improvements or additional testing necessary to prevent regressions and similar errors from showing up in the future.


## I'll be curious

I like knowing what's going on.
If there's an aspect of a system I'm unfamiliar with but want or need to change, I like to start by documenting what it does currently.
This is a good checksum of both my understanding and the system behavior directly.
I don't like the mindset of just rebooting machines until they work.
If a problem occurs twice it's "recurring" and I want to establish why.
I debug and trouble shoot by continuously forming hypotheses that can be quickly verified or refuted rather than assuming that my instinct about a problem is immediately correct.

I also really enjoy picking up new things.
It's impossible to pretend I have any idea what it's like to be a beginner again, but picking up new tools or languages gives me a small taste of that and I find it really healthy and humbling.

Being an involved participant in all aspects of an organization is important to me.
That isn't to say I'll take on everyone's job; rather, I'll seek to appreciate the skill with which they perform their duties.

## I'll be a mentor and a learner

I don't like hoarding knowledge.
If I know something that would be useful to other members of my team I share it openly.
As a youth I tended toward know-it-allism and nowadays I try to only provide situation-specific solicited advice.
I've had a fair number of instructors who tried to hold back some knowledge, so I'd always be beholden to them.
That really disappoints me; I love it when people I'm sharing knowledge excel without my assistance.

You cannot really teach without being open to learning at the same time.
I really enjoy reading technical books and blog posts, and am getting better at reading technical papers, which for some reason have always been difficult for me even when the subject matter is fascinating.

I have an internal mental process for determining when to ask for help that weighs the benefit of struggling with a problem to cement its solution with the time sensitivity of completing the task and the availability of those around me.
I don't dislike asking for help and I sink more time into personal projects than most work-related ones before soliciting for assistance.
I'm happy to receive a "Read the fine manual" response, especially from someone who has worked with the manual and knows my answer will be there.


<hr class="notitle-break">

So that's me.
This article doesn't really get into my technical proclivities like what languages and tools I like using.
That is purposeful because even to me that's secondary to the approach and attitude.

If I sound like the type of engineer you want on your team, [let me know](mailto:steven+theengineer@nuclearsandwich.com)!
