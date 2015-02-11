---
title: Drupal
tags: []
...

# Training
* Intro's
* Build a drupal site
* Install profiles
* Create a custom module
* Drupal theming
* Contrib modules

# Intro
* Intro drupal
* Intro vagrant
* Intro LAMP stack
* Intro drush

# Drupal
* Open source
* community
* online documentation 
  https://www.drupal.org/documentation
  https://api.drupal.org/api/drupal

# Drupal termen
* nodes
* entity types
    * abstract
    * nodes, taxonomy terms , user profiles
* Taxonomy
    * vocabulary, taxonomy terms
* Users
* Modules
* Theme
* Region & blocks
* Menu

# Paths
* clean url's
    * http://www.drupaltraining.loc/?q=node/1
    * http://www.drupaltraining.loc/node/1

```
/etc/httpd/conf/httpd.conf

LoadModule rewrite_module modules/mod_rewrite.so
```

```
.htaccess

RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_URI} !=/favicon.ico
RewriteRule ^ index.php [L]
```

# Vagrant

```
Vagrantfile

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 config.vm.box     = "drupaltraining" 
 config.vm.box_url = "drupaltraining.box"
 config.vm.hostname = "drupaltraining"
 config.vm.network "private_network", ip: "192.168.33.10"

 config.vm.synced_folder "www/", "/var/www", owner: "apache", group: "apache"

 config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.memory = 1024
    v.cpus = 2
 end

end

```

* base box


# LAMP stack
* Linux
* Apache
* MySql
* PHP

# Linux

# Apache

```
Configuration

/etc/httpd
```

```
Default paths

/var/www
/var/log/httpd

```

```
Commando's

sudo service httpd start
sudo service httpd stop
```

# Mysql

# PHP

# Build a drupal site
* Build drupal code base
* Install drupal
* content types
* install modules
* views
* blocks
* permissions
* menu
* taxonomy
* exposed filters
* path auto
* images styles
* display modes

# Build drupal code base
## drush make files

```

core = 7.x
api = 2

; defaults
defaults[projects][subdir] = "contrib"

; Drupal core
projects[] = "drupal"

; contrib

```

## Makefile

```

ROOT := www
DRUSHMAKE := drush.make

drushmake:
        cd $(ROOT) && drush make --no-gitinfofile ../$(DRUSHMAKE) .

```

## Makefile +
```

build: clean chmod drushmake 

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
```

## Example
```

[tomswiggers@tom drupaltraining]$ make drushmake
cd www && drush make --no-gitinfofile ../drush.make .
Beginning to build ../drush.make.                                                                                                                                                                                                                                                                                 [ok]
drupal-7.34 downloaded.
```
  
# Install drupal
## Database
```

mysql> create database drupaltraining;
Query OK, 1 row affected (0.00 sec)
```

## Install
* install via web interface
  http://www.drupaltraining.loc/install.php
* install with drush

## Settings
``` 
settings.php

215 $databases = array (
216   'default' =>
217   array (
218     'default' =>
219     array (
220       'database' => 'drupaltraining',
221       'username' => 'root',
222       'password' => 'admin',
223       'host' => 'localhost',
224       'port' => '',
225       'driver' => 'mysql',
226       'prefix' => '',
227     ),
228   ),
229 );
```

## Drush

## Content types

## Install modules

## Views

## Blocks
  
# Install profiles

# Custom module
* hook system
* hook_install, hook_enable
* hook_menu
* hook_update_N
* custom field formatter

# Development modules
* devel
* environment_indicator
* potx
* diff 

# Drupal theming
* theme sugestions
* override theme functions
* tpl files
* hook_theme
* page alter
* Features
* Form API
* Config settings
    * variable get/set

# Contrib modules
* display suite
* devel
* environment indicator
* features
* strongarm
* context
* rules
* diff
* date
* wysiwyg
* ...
