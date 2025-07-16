# BatLit: The Bat Literature Project

This repository contains the sources that produce https://batlit.org. The website is currently hosted by GitHub Pages and uses Jekyll, GitHub's default static site generator. Please note that this site also contains BatLit Corpus metadata, Zenodo integration data, as well as automatically generated batlit references lists.

## Files

There's many files in the repository. Some are listed below to get situated.  

 * [```index.md```](index.md) - contains the https://batlit.org landing page
 * [```datapaper.md (draft)```](datapaper.md) - technical background on BatLit and the associated BatLit Corpus versions

## Contributing 

Improvements to BatLit are encouraged! If you feel comfortable, please submit pull requests when proposing changes to batlit. Otherwise, please [open an issue](../../issues/new) or send an email to [batlit@batbase.org](mailto:batlit@batbase.org).

## Local Enviroment Setup

Configure your local environment to help test changes locally first. 

Tailored for Ubuntu, similar steps can be taken for Mac and other operating systems.

Steps:

1. Install ruby v3.2.3 via ```sudo apt install ruby-full``` or equivalent. This also installs bundle .
2. To install gems (Ruby libraries/modules) into a user writable place, update ```~/.bashrc``` to include:
```
export GEM_HOME="/home/some-username/.gem/ruby/3.2.3"
export PATH=$PATH:$GEM_HOME/bin
``` 
3. Start a new shell/terminal, or run ```source ~/.bashrc``` 
4. Run ```bundle install``` assuming that a [Gemfile](./GemFile) exists with content:
```
source 'https://rubygems.org'

# see https://pages.github.com/versions/ 
# for versions use by github infrastructure
gem 'github-pages', group: :jekyll_plugins
```
5. Render local website by running ```bundle exec jekyll serve```
6. Open a browser and visit http://localhost:4000 . 
