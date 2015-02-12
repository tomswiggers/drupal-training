# Drupal training
![drupal logo](drupal-logo-big.png)

https://github.com/tomswiggers/drupal-training

# Overzicht
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
* Community
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

## Overzicht
* wrapper
* providers
    * virtualbox
    * lxc
    * ...
* base box
* productie omgeving

## Vagrantfile
```

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

## Commando's

```
Start vagrant box

vagrant up
```


# LAMP stack
* Linux
* Apache
* MySql
* PHP

# Linux
* basic commands

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
sudo service httpd restart
```

```

[vagrant@drupaltraining www]$ sudo vim /etc/httpd/conf/httpd.conf                                                                                                                                                                                                                                                            
[vagrant@drupaltraining www]$ sudo service httpd restart
Stopping httpd:                                            [  OK  ]
Starting httpd:                                            [  OK  ]

```

# Mysql

# PHP

# Build a drupal site
* Build drupal code base
* Install drupal
* Configure drupal

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
Beginning to build ../drush.make.                         [ok]
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

## Drush site-install

```

[vagrant@drupaltraining www]$ drush si -y
You are about to DROP all tables in your 'drupaltraining' database. Do you want to continue? (y/n): y
Starting Drupal installation. This takes a few seconds ...                                            [ok]
Installation complete.  User name: admin  User password: 9Jq6mHFUW3                                   [ok]
[vagrant@drupaltraining www]$ 

```

## Drush si parameters
* Extra parameters zijn mogelijk
    * install profile
    * admin name
    * admin pass
    * database settings

```

drush si -y --account-name=admin --account-pass=admin
drush si -y minimal --account-name=admin --account-pass=admin
```

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

# Configure drupal

## Overzicht
* modules
* content types
* views
* blocks
* permissions
* menu
* taxonomy
* path auto
* images styles
* display modes


## Modules
* Home > Administration > modules

## drush
```
List modules

[vagrant@drupaltraining www]$ drush pml
 Package  Name                        Type    Status         Version 
 Core     Aggregator (aggregator)     Module  Not installed  7.34    
 Core     Block (block)               Module  Enabled        7.34    
 Core     Blog (blog)                 Module  Not installed  7.34    
 Core     Book (book)                 Module  Not installed  7.34    
 Core     Color (color)               Module  Not installed  7.34    
 Core     Comment (comment)           Module  Not installed  7.34    
 Core     Contact (contact)           Module  Not installed  7.34    
```

```
Enable module

[vagrant@drupaltraining www]$ drush en -y image
The following extensions will be enabled: image, file
Do you really want to continue? (y/n): y
file was enabled successfully.                                   [ok]
image was enabled successfully.                                  [ok]
image defines the following permissions: administer image styles
```

## drush
```
Disable module

[vagrant@drupaltraining www]$ drush dis -y image
The following extensions will be disabled: image
Do you really want to continue? (y/n): y
image was disabled successfully.                                                                                                                                                                                                                                                                                  [ok]
```

## Content types
* field ui
* display modes
* field formatters

## Install modules

## Blocks

## Views
* Pages
* Blocks
* Exposed filters

## Menu

## Users & permissions
* users
* roles
* permissions

## taxonomy
## path auto
## images styles

# Custom module
* hook system
* hook_install, hook_enable
* hook_menu
* hook_update_N
* custom field formatter

# Install profiles

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

# Interesting modules
## Contrib modules
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

## Development modules
* devel
* environment_indicator
* potx
* diff 

