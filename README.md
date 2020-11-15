# nicholdav-info-jekyll

attempt to set up a personal page using jekyll
I'm following the mold of [academic pages](https://academicpages.github.io/)
but I would like the flexibility to change themes if I want.

why bother?
* themes for `jekyll` just look better to me than all the Python themes.
  Sorry `pelican` -- I don't know why but seems like Ruby developers have
  better taste in css.
* I want the flexibility to change themes
* fun exercise in using libraries in a language besides Python -- I like
  to see what the tooling is like

One thing that frustrates me as an total control freak is there is little info
on the `academicpages` site about what changes were made to the `minimal-mistakes`
theme and why. So here's what I learned.

Here's how I got a similar looking site:
* set up a basic environment for working with `jekyll`
  - their quickstart is here: https://jekyllrb.com/docs/
  - I'm on PopOS, a Linux distribution similar to Ubuntu, and I use oh-my-zsh,
    so I followed these instructions: https://jekyllrb.com/docs/installation/ubuntu/
    except I changed `.bashrc` to `.zshrc`
* then I followed the directions for managing dependencies with `bundler`
  so that I could install the `minimal-mistakes` template as a `gem`
  instead of forking their repo and modifying it
  + https://jekyllrb.com/tutorials/using-jekyll-with-bundler

* use the `redirect` plugin so that the site lands on "about"
* add an `about.md` -- copy the liquid header from `academicpages`
* make sure `_config.yml` specifies defaults for `pages` so that your  
  theme gets applied to this `about.md` file
  + I copied the `#defaults` section from the `academicpages` `_config.yml`
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
