ROOT := www
DRUSHMAKE := drush.make

build: clean chmod drushmake patch finish

clean:
	-rm -rf $(ROOT)/sites/all/modules/contrib
	-rm -rf $(ROOT)/includes
	-rm -rf $(ROOT)/misc
	-rm -rf $(ROOT)/modules
	-rm -rf $(ROOT)/scripts
	-rm -rf $(ROOT)/themes
	-rm -rf $(ROOT)/profiles/minimal
	-rm -rf $(ROOT)/profiles/standard
	-rm -rf $(ROOT)/profiles/testing
	-rm -f $(ROOT)/web.config
	-rm -f $(ROOT)/.htaccess
	-rm -f $(ROOT)/.gitignore
	-rm -f $(ROOT)/*.txt
	-rm -f $(ROOT)/*.php

chmod:
	chmod a+w $(ROOT)/sites/default

drushmake:
	cd $(ROOT) && drush make --no-gitinfofile ../$(DRUSHMAKE) .

patch:
	echo "patches"
finish:
	@echo 'finished'
