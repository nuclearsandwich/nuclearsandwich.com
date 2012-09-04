---
layout: post
title: How I Used a "Debugging Feature" of Pry to Build Cage
date: 2012-05-16 21:57:00 -7
comments: true
published: true
categories: ruby pry cage
---

[Pry](http://pry.github.com) is an alternative interactive Ruby environment
similar to IRB. In addition to looking a little nicer through nearly live
colorization, Pry offers some pretty powerful features for exploring, modifying,
and debugging Ruby applications in a live system.

Pry's namesake ability to "pry" open an object is not limited to debugging use.
It's actually a really straightforward way to build any kind of domain specific
REPL. I think I just coined that term but it fits well and you'll soon see why.

The Backstory
-------------

When I working at [NOWBOX](http://nowbox.com) I spent a lot of time hitting our
API during ad-hoc testing. I was doing enough of this that just using curl
wasn't cutting it.

Don't get me wrong, curl is awesome and super useful. But it lacks a few
niceties. Chief among them curl, like HTTP, is stateless without the use of
cookie files and given that we were using a token-based authentication system,
simulating device-API interaction using exclusively curl was neither fun nor
easy.

During this time, we were also using
[Rack::Test](https://github.com/brynary/rack-test), which I really like. It's a
solid and purposeful DSL and great at what it does. What it isn't good at is
being interactive. I'd get colourful explosions(stacktraces) whenever I tried to
pry into and look at a test using `Rack::Test`.

We already had the awesome [Faraday](https://github.com/technoweenie/faraday)
included in our project, so I hacked together a quick rake task that would set
up a `Faraday::Connection` and pry into it. What did this get me? I now had my
interactive `Rack::Test`.

### Cage Version -1

``` ruby
# Rakefile
task :client_console do
  require "faraday"
  require "pry"
  uri = case ENV["target"]
        when "production"
          "http://api.superawesomepage.com/1/"
        when "staging"
          "http://api.staging.superawesomepage.com/1/"
        else
          "http://localhost:3000/1/"
        end
  Faraday::Connection.new(uri).pry
end
```

Building the Gem
----------------

Pry made this really easy. So easy that later on, when I wanted to rewrite the
above code and turn it into a reusable gem I kept the same strategy.

I build my DSL class, `Cage::Console`, which also handles all the initialization
such as config file loading and default values for variables. It also overloads
some of Pry's settings to get a more interesting prompt string and suppressing
they default `~/.pryrc` config file loading.

``` ruby
# lib/cage/console.rb
class Cage::Console
  def initialize config_file = nil
    configure_pry
    read_config_file File.expand_path config_file if config_file
    default_to_rubygems
    reinitialize_connection
  end

  ## The rest of the show
  ## ...
  ## The party starter
  def self.start! *args
    new(*args).pry
  end
end
```

The rest of the class is the domain specific stuff that deals with delegating to
the Faraday connection object and building the response object. I built my own
wrapper around Faraday's response so I could improve how they are displayed as
return values.

``` ruby
# lib/cage/response.rb
class Cage::Response
  ## Delegating code
  ## ...
  ## Prettification code
  def inspect
    <<-PRETTY
Status: #{status}

Headers:
#{headers.map { |k, v| "  #{k}: #{v}" }.join "\n"}

Body:
  #{body}

#<Cage::Response:(#{url})>
      PRETTY
    end
  end
end
```

It's certainly verbose but the primary function is to show you the complete
result of an HTTP request, which it does.

Concluding
----------

That's  basically all there is to it. This feature of Pry that's mainly
advertised as a way to get hands-on with your objects for debugging is also a
great way to build a domain specific or domain focused interactive environment.
Depending on how much you want to customize Pry's interface you don't even need
a thorough understanding of Pry's internals. If you're more interested in the
features *of* Cage than the mechanics of its construction you can install it
from RubyGems using `gem install cage` or check out its [project page](/cage).
The complete source for Cage is on
[GitHub](https://github.com/nuclearsandwich/cage). I hope you use Pry and Cage
to build awesome stuff!
