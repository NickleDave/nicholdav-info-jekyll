---
layout: post
title:  "How to use `jekyll` to set up your own academic website"
---

I've had a personal web page for sometime that I set up with
`pelican`, a static web page generator in Python.
Basically I adopted my approach from the one Jake Vanderplas took for his
["pythonic perambulations" blog](https://github.com/jakevdp/jakevdp.github.io-source/).
However I wasn't happy with how my page looked
(which has nothing to do with Jake Vanderplas,  
and everything to do with my moribund graphic design and css/html skillz).
And it was time to update my site anyway.
Recently I noticed a collaborator had set up their own personal site using the
excellent [`academicpages`](https://academicpages.github.io/) repository,
developed by [Stuart Geiger](https://stuartgeiger.com/).
`academicpages` is great if you are trying to survive in academia
and you don't have time to bother learning how to use a static site generator.
With `academicpages` you just want to follow a couple steps to add your own
content to some existing template, to easily get a site.
Some background:
`academicpages` is a fork of `minimal-mistakes`,
a theme for the `jekyll` library,
which is a static site generator written in
the `ruby` programming language.
You can think of it as analogous to `pelican` in Python
(or Ruby developers might tell me that `pelican` is analgous to `jekyll`).
One advantage of using `jekyll` is that
GitHub treats it like a first-class citizen,
letting developers easily create web pages for themselves or documentation
for their projects, through the
[GitHub Pages service](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/about-github-pages-and-jekyll).
And it's free, another plus for academics.
Stuart modified the `minimal-mistakes` theme in such a way
that other academics could simply fork its repo
on GitHub and use the web interface to add their own content,
without needing to know how to use `jekyll`
or how to use any developer tools like `git`.

But I knew there were things I wanted to modify, such as the theme / template.
There's little documentation in the `academicpages` guide about
*what* changes were made to the `minimal-mistakes` theme, and why.
How did Stuart evolve the template from your standard `jekyll`
minimal blog page to a very specific set-up for academics
that lands on the `about` page, showing a profile in the sidebar
with links to academia specific sites, and
includes tabs like "publications", "talks", etc.?
I tried looking at the `git` commit history but couldn't
piece it together.
I figured there couldn't be *too too* many steps
to setting up a similar site on my own.

So here's the process I went through to get something similar.
I'm documenting it for my future self, and for you if
you want to do the same. Why bother?
A lot of the themes for `jekyll` just look better to me than all the Python themes.
I love to support Python libraries like `pelican`,
and some of the themes are very versatile,
like their version of
[`bootstrap`](https://github.com/getpelican/pelican-themes/tree/master/pelican-bootstrap3).
But somehow `minimal-mistakes` and other `jekyll` themes just look better
to my (untrained) eye.
I also wanted the flexibility to change themes.
Last but not least, this is a fun exercise
in using libraries in a language besides Python.
It's interesting to experience the tooling in the ecosystems
of other programming languages.

## step-by-step guide to developing your own 'academicpages'
Here's the summary version first so you know what you're getting into:
1. set up a `jekyll` development environment
2. make the landing page be your about page
3. make the sidebar show your profile with links
4. add links to publications, talks, etc., in the nav bar at the top of the page

### setting up a development environment
* set up a basic environment for working with `jekyll`
  - their quickstart is here: https://jekyllrb.com/docs/
  - I'm on PopOS, a Linux distribution similar to Ubuntu, and I use oh-my-zsh,
    so I followed these instructions: https://jekyllrb.com/docs/installation/ubuntu/
    except I changed `.bashrc` to `.zshrc`
* then I followed the directions for managing dependencies with `bundler`
  so that I could install the `minimal-mistakes` template as a `gem`
  instead of forking their repo and modifying it
  + https://jekyllrb.com/tutorials/using-jekyll-with-bundler

### making the "landing page" be your "about" page
* use the `redirect` plugin so that the site lands on "about"
* add an `about.md` --
  make sure you copy the [YAML front matter](https://jekyllrb.com/docs/front-matter/)
  from `academicpages`
* make sure `_config.yml` specifies defaults for `pages` so that your  
  theme gets applied to this `about.md` file
  + I copied the `#defaults` section from the `academicpages` `_config.yml`

### making the sidebar show your profile, with links
+ to make the author profile in the sidebar render all the links that are
  in `academicpages` but not in `minimal-mistakes`, i.e. academia specific
  things like a Google Scholar page, ORCID profile, etc., you'll need to add
  an `author-profile.html` in an `_includes` directory.
  Basically I copied the `author-profile.html` from `minimal-mistakes` and
  then added the relevant if-then statements in the `author-links` section.
* for things like an author pic, I added them in `assets/images/` -- I think
  this is consider "idiomatic Jekyll" even though the `academicpages` repo
  just has an `images` folder in its root. Doesn't matter too much as long
  as you specify the correct relative path in your `_config.yml`

### adding links to publications, talks, etc., in the masthead nav bar
* Unique to `academicpages` are the links in the navigation bar
  at the top of the page to pages with lists of publications, talks,
  and so on.
  Basically, if you want the same thing, there's three things you'll need to do:
  1. you'll need to copy the 'navigation.yml' file from `academicpages`,
  placing it in a `data/` subfolder in your project root,
  and modify it as you see fit.
  2. add two related sections in your `_config.yml`:
    + a 'collections' section,
      like [this one](https://github.com/academicpages/academicpages.github.io/blob/25c30de2b4ce3e3f23559384699bb4b9865d6473/_config.yml#L176)
      in the `academicpages` `_config.yml`.
    + and corresponding keys in your `defaults` section
      as shown [here](https://github.com/academicpages/academicpages.github.io/blob/25c30de2b4ce3e3f23559384699bb4b9865d6473/_config.yml#L212)
      in the `academicpages` `_config.yml`.
  This *is* explained very briefly in the `about.md` of `academicpages` but
  here's a quick explainer of how it all works.
  `minimal-mistakes` lets you add links to the masthead
  by supplying a file called `navigation.yml`.
  This is a
  [standard approach in `jekyll`](https://jekyllrb.com/tutorials/navigation/).
  There are other uses for [data files](https://jekyllrb.com/docs/datafiles/).
  What's specific to `minimal-mistakes` is that you
  add these links to the nav bar by specifying a `main` key
  in `navigation.yml`, as described here:  
  https://mmistakes.github.io/minimal-mistakes/docs/navigation/
  In the case of `academicpages`,
  the links have the names of the specific sections
    in the `navigation.yml` with the keys "publications", "talks", etc.
