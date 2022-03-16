# nicholdav-info-jekyll

## Setup

1. set up a basic environment for working with `jekyll`
  - their quickstart is here: https://jekyllrb.com/docs/
  - I'm on PopOS, a Linux distribution similar to Ubuntu, and I use oh-my-zsh,
    so I followed these instructions: https://jekyllrb.com/docs/installation/ubuntu/
    except I changed `.bashrc` to `.zshrc`
2. follow directions for managing dependencies with `bundler`
  to install the `minimal-mistakes` template as a `gem`
  instead of forking their repo and modifying it
  + https://jekyllrb.com/tutorials/using-jekyll-with-bundler
* use `poetry` to set up an environment for `ghp-import`

## Usage

Building and publishing is done with the Makefile.
Run `make help` to see the commands.

## About the site design

Please see this rambling and poorly-edited blog post:
https://nicholdav.info/2022/03/16/how-to-use-jekyll-to-set-up-your-own-academic-website.html
