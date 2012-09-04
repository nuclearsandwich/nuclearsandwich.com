---
layout: post
title: "A Look at Ruby Case Expressions"
date: 2011-09-08 08:33:00 -7
comments: true
categories: [ Ruby, Programming ]
---

Ruby, like many languages has a case-when construct for more refined conditional
execution than if-then-else can provide. Technically all case constructs could
be written as if-then-else-if-then...else but you wouldn't enjoy it.

## Ruby's case-when is an expression

However, there are a number of things that make Ruby's case-when special. The
first comes from Ruby's functional roots. It's powerful but deceptively simple.
Ruby's case-when construct is an *expression*. Which means, among other things,
it returns a value.

In a traditional imperative style a case statement might look like:

```ruby
conditional_variable = :some_default_value
case our_condition
when :first
  conditional_variable = :one_thing
when :then
  conditional_variable = :another
end
```

The that isn't ideal for a number of reasons. `conditional_variable` is set
visibly three times which as any freshman can tell you is frowned upon.
Academics have stuffier reasons for it but the most important is that it
decreases readability because we aren't sure what the value will be after
execution. Setting it so many times is also a code duplication, albeit a small
one. We can take advantage of Ruby's case-when *expression* with this code:

```ruby
conditional_variable = case our_condition
                       when :first
                         :one_thing
                       when :then
                         :another
                       else
                         :some_default_value
                       end
```

Doesn't that look nicer? `conditional_variable` is only set once and the
intent is clear, we want the value to depend on `our_condition`.

## case-when uses triple equals for comparison

This got me good this morning and spawned this article. If you're not familiar
with `===` in Ruby then the best explanation comes from *_why's Poignant Guide
to Ruby* which really is worth reading. I've referred back to it multiple times
to help myself and those around me fully understand basic Ruby concepts like
`nil`, truthiness and falsiness, and, __fanfare please__, double equals versus
triple equals.

> The double equals gives the appearance of a short link of ropes, right
> along the sides of a red carpet where only `true` can be admitted.

```ruby
if approaching_guy == true
  puts "That necklace is classic"
end
```

> ...
> [This case-when statement]

```ruby
case year
when 1894
  "Born."
when (1895..1913)
  "Childhood in Lousville, Winston Co., Mississippi."
else
  "No information about this year."
end
```

> is identical to

```ruby
if 1894 === year
  "Born."
elsif (1895..1913) === year
  "Childhood in Lousville, Winston Co., Mississippi."
else
  "No information about this year."
end
```

> The __triple equals__ is a length of velvet rope, checking values much like
> the __double equals__. It's just: the triple equals is a longer rope and it
> sags a bit in the middle. It's not as strict, it's a bit more flexible.
> Take the Ranges above. `(1895..1913)` isn't at all equal to `1905`.

> No, the Range `(1895..1913)` is only truly equal to any other Range
> `(1895..1913)`. In the case of a Range, the triple equals cuts you a break
> and lets the Integer `1905` in, because even though it's not equal to the
> Range, it's included in the set of Integers represented by the Range. Which
> is good enough in some cases, such as the timeline I put together earlier.

## My Mistake
This is what I did which caused me to write this as penance.

```ruby
def local_tweet_object input
  tweet_hash = case input.class # the screw-up
  when String
    MultiJson.decode input
  when Hash
    input
  else
    fail ArgumentError.new(
      "Cannot process #{input.class} only String or Hash")
  end
  LocalTweet.new tweet_hash
end
```

This code was raising the following error.

`ArgumentError: I don't want Hash give me only String or Hash`
... *huh?*

At first glance it looked fine, but then we remember that case-when uses `===`.
Again, we think "this shouldn't be an issue, if it's good enough for `==` it
should be fine for `===`." But `===` behaves specially for certain types in Ruby
such as Classes, Arrays, and as we saw before, Ranges.

For simple scalar values `===` acts like you expect.

```ruby
12 === 12 #=> true
12 === 13 #=> false
:rats === :rats #=> true
"pens" === "pens" #=> true
"space" === "fact" #=> false
```

And we know how `===` treats ranges

```ruby
(8..64) === 32 #=> true
```
But note that

```ruby
(8..64) === (8..64) #=> false
```

Suddenly!

```ruby
Integer === 12 #=> true!
```
waitaminute.. what?

So Ruby can tell that `12` is a type of Integer and thus `===` can be described
partially as an includes and typeof operator. But there are some further
gotchas.

```ruby
[ 1, 2, 3 ] === 1#=> true
[ 1, 2, 3 ] === [ 1, 2, 3 ]                         #=> true
[ 1, 2, 3 ] === [ 1, 2 ]                            #=> false
{ :foo => :bar } === { :foo => :bar }               #=> true
{ :foo => :bar } === :foo                           #=> false
{ :foo => :bar, :baz => :qux } === { :foo => :bar } #=> false
```

`===`'s behavior isn't completely intuitive even within Ruby's standard Classes.
Which brings us (finally) back around to my original error.
`Hash === Hash #=> false`


The fix is simple, just change

```ruby
case input.class
```
to

```ruby
case input
```

I posted on identi.ca a friendly notice about this easy mistake and was asked to
provide clarification. So here, just over 24 hours late, it is. The full source
code is provided [here](https://gist.github.com/1112335)
