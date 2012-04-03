---
layout: post
title: "On Learning: Making and Checking Assumptions"
date: 2012-04-02 10:38
comments: true
categories: 
---

With increasing frequency, I've been afforded the opportunity to teach people
who are completely new to programming and this inevitably leads to me espousing
my preferred method for learning anything: Making an assumption and verifying or
refuting it through experimentation.

Yesterday I had the pleasure of teaching two fantastic burgeoning developers the
concept of method composition in Ruby. For experienced developers, it is as
natural as breathing, but too often our memories of our early programming
experiences are clouded over with the same terror we see in the eyes of our
students.

At almost every stage there were simple questions, questions it would have taken
me seconds to address had I given a direct answer. But learning to program (or
do much else) needs to go deeper than just assembling facts. In order to do
well, we have to have our own mental interpreters and compilers and process the
code in our minds. The sooner we start developing this trait in new programmers,
the better off they'll be. So my general answer was

> "Well, what do you *think* will happen?"

Queue audience groan. By asking this ad nauseum and forcing them to give me an
answer before hitting enter. I'm contributing in a real way to building their
mind's Ruby interpreter.

If this sounds eerily like the [scientific method][0], that's because it is! We
just condensed for tiny, one or two line experiments in Ruby.

Not Just for N00bs
------------------

I've finally started reading [SICP][1] and one of the very first exercises
revealed one of my achilles' heels.

I was asked to give the value of the evaluated expression below:
```scheme
(- 9 1)
```

I can *never* remember what this shakes out to. Is it `9 - 1 = 8` or `1 - 9 =
-8`? I didn't know off the top of my head. But before I fired up Racket to see
what the answer was, I forced myself to make a guess. Would it be 8, or -8? My
guess was 8.

Only after forming that hypothesis did I throw that expression into an
interpreter.

As it turns out, it does evaluate to `8`. ___Assumption Verified! A winner
is me!___ Would it have mattered if I'd been wrong? Not really, I would have
learned the same lesson.

The rise of [Test Driven Development][2] is actually the rise of the application
(in a very minor and partial way) the scientific method in Software Engineering.
We're making assumptions about the goals (end-to-end tests) and design (unit
tests) of our software and codifying them in form of our tests. These get
challenged and verified or refuted whenever we run our tests. As our software
changes, so do our hypotheses around it.

So regardless of whether you're writing code for the first time, or a veteran
software developer. Take the advice of John and John of They Might Be Giants,
*you need a test*.

<iframe
	width="640" height="480"
	src="http://www.youtube.com/embed/9kf51FpBuXQ?rel=0"
	frameborder="0" allowfullscreen>
</iframe>

[0]: https://en.wikipedia.org/wiki/Scientific_method
[1]: http://mitpress.mit.edu/sicp/
[2]: https://en.wikipedia.org/wiki/Test-driven_development


