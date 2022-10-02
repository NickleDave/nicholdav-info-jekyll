PY?=poetry run
JEKYLL?=bundle exec jekyll

BASEDIR=$(CURDIR)
SOURCEDIR=$(BASEDIR)
DESTINATIONDIR=$(BASEDIR)/_site
CONFFILE=$(BASEDIR)/_config.yml

GITHUB_PAGES_REMOTE=git@github.com:nickledave/nicholdav.info.git
GITHUB_PAGES_BRANCH=master

help:
	@echo 'Makefile for a jekyll Web site                                            		'
	@echo '                                                                          		'
	@echo 'Usage:                                                                    		'
	@echo '   make build                          build website for production       		'
	@echo '   make clean                          remove the generated files         		'
	@echo '   make serve [PORT=8000]              serve website at http://localhost:8000'
	@echo '   make publish-to-github              publish web site, using gh-pages   		'
	@echo '   make publish-to-github-force        force push web site, using gh-pages		'
	@echo '                                                                          		'
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html   		'
	@echo 'Set the RELATIVE variable to 1 to enable relative urls                    		'
	@echo '                                                                          		'

build:
	$(JEKYLL) build -s $(SOURCEDIR) -d $(DESTINATIONDIR) --config $(CONFFILE)

clean:
	[ ! -d $(DESTINATIONDIR) ] || rm -rf $(DESTINATIONDIR)

serve:
ifdef PORT
	$(JEKYLL) serve --port $(PORT)
else
	$(JEKYLL) serve
endif

publish-to-github: build
	$(PY) ghp-import -n -m "publish-to-github from $(GIT_COMMIT_HASH)" -b blog-build $(DESTINATIONDIR)
	git push $(GITHUB_PAGES_REMOTE) blog-build:$(GITHUB_PAGES_BRANCH)

publish-to-github-force: build
	$(PY) ghp-import -n -m "publish-to-github-force from $(GIT_COMMIT_HASH)" -b blog-build $(DESTINATIONDIR)
	git push -f $(GITHUB_PAGES_REMOTE) blog-build:$(GITHUB_PAGES_BRANCH)

.PHONY: build help clean serve publish-to-github publish-to-github-force
