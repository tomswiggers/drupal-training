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

# Mysql

# PHP

# Build a drupal site
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
  
# Development modules
* devel
* environment_indicator
* potx
* 

# Install drupal
* settings.php
* files folder
* install through web interface
* install with drush

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
