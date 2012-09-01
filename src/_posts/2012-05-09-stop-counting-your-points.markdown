---
layout: post
title: "Stop Counting Your Points"
date: 2012-05-09 14:51
comments: true
published: true
categories: university education school
---

I walked into class yesterday afternoon where my professor teaches, back-to-back, a
section of upper division Data Structures and Algorithms followed by my section
of Formal Languages and Automata. On Monday, both classes had an exam. (Not my
best I'm afraid, I spent the weekend at
[FarmhouseConf](http://farmhouse.la/conf) rather than studying. Worth it.) I
arrived to class today and overheard a familiar story as the last class was
leaving. A student was contesting his score on a particular problem. The
crux of his reasoning was that while he *was* wrong, he "felt" he "earned more
points" than what was recorded. I'm normally not a fan of the air-quotes for
emphasis or sarcasm, but in this case they were also the exact words used by the
student in question.

There's something odd about people who pay attention to the points rather than
what they learned. I will be the first to jump in and bitch about how much I pay
for tuition but also freely admit that I pay far less than an out-of-state or
private school student. School is fucking expensive. So why? Why why why why
*why?* would you haggle over how many points you "earned", when you can and
should be figuring out what you didn't learn which cost you those points. On
tests where I do poorly, I often spend about as much time trying to figure out
what I did wrong as I did taking the test in the first place. I'm also a really
shitty student. I elect not to take notes and I am presently writing the first
draft of this post in class while something I already know is being reviewed.

Situations like this one baffle me, but also emphasizes that there's no metric I
can use other than day-to-day individual progress to represent the achievements
of my students lest they (or I) become fixated on the metric. I keep incredibly
detailed notes about the individual skills and weak points of anyone who I
regularly teach or mentor, but I neither have nor will try to grade or rate
them. Why fixate on numerals when you could fixate on learning new stuff?

The vocabulary choices of this student remind me of something my seventh grade
history teacher talked about on the first day of school. Which is the subtle and
subconscious vocabulary choices of students when discussing grades. "I got an A.
I got an A. He *gave* me an F." It's only human to want to take credit for our
achievements while marginalizing our failures. I have certainly been guilty of
this in the past. I have <strike>been given</strike> achieved three failing
grades in my life, two in high school and one in college.

* *I earned* an F in second semester Geometry because I failed to find the
  subject interesting and couldn't be arsed to do the homework or get up before
  7AM to get to class on time.

* *I earned* an F in second semester American History because I elected to take
  no notes in spite of the fact that our notebooks were going to be collected
  and graded.

* Incidentally, the one college course I failed was an online Jazz History
  course during a winter session. I failed because I completely forgot I
  registered. I never signed in or even thought about it until it showed up on
  my transcript.

I don't look too far down on this guy though. When *I* was taking the very same
Data Structures class, albeit with a different professor, we were required to
submit our assignments online to a system which auto-grades our programming
assignments by running our own JUnit tests, and analyzing them for coverage. As
well as JUnit tests written by our professor on our code. One thing the system
did that I absolutely hated was run Checkstyle with the official SJSU Java Style
guidelines encoded in XML. Well, this style guide was written before Java had
Generics and had never been updated. So Checkstyle threw a fit when I had
`Node<E>` instead of `Node < E >`. In order to get it to shut up (and claim the
final five points on the assignment) I had to ruin my code with this offensively
spaced style.

I mentioned this to the professor and he suggested that it was always an option
to sacrifice those points in the name of doing things right and grades be
damned. Since then, I've submitted plenty of assignments that don't precisely
meet specification. Mostly I get docked because I don't include Eclipse project
files with my source code which means the professors have to find the command
line and run Ant (I also provide Makefiles). In any case, it was eye opening to
hear a professor give me permission to get a less-than-optimal score simply
because something else is more important. 

So stop counting your points and start making sure you learn. Besides, learning
is more fun.

