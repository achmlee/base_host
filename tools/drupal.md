# Drupal (Last Updated: 2020.11.30)

## Reference
* https://www.drupal.org/docs/develop/using-composer/starting-a-site-using-drupal-composer-project-templates
* https://www.lullabot.com/articles/drupal-8-composer-best-practices
* https://daylerees.com/the-composer-lock-file/
* https://matti.dev/post/setup-install-drupal-9-with-composer-and-drush

## Install
### List all versions
* `$ composer show drupal/recommended-project --all`

### Commands
* `$ composer install` - First time setup, creates composer.lock file.
* `$ composer install` - If new package added, addes new package and update composer.lock.
* `$ composer update` - Updates all version to latest and updates composer.lock file.
* `$ composer update package/name` - Updates specific package version and updates composer.lock file.

### Autocreate composer.json
#### Drupal 7
* `composer create-project drupal-composer/drupal-project:7.x-dev <project_dir>`

#### Drupal 8/9
* `$ composer create-project drupal/recommended-project <project_dir>` - or -
* `$ composer create-project drupal/recommended-project:9.0.9 <project_dir>`

### Add modules/themes
* `$ composer require drupal/<modulename>`
* `$ composer require 'drupal/<modulename>:<version>'`
* `$ composer require 'drupal/<modulename>:^1.0` - Carat constraint (anything except major release, i.e. 1)
* `$ composer require 'drupal/<modulename>:~1.0.x` - Tilde constraint (anything higher than last digit, i.e. x)
* `$ composer require --dev drupal/devel` - Add dev only flag
  * `composer install --no-dev` - Install without dev options

### Update
* `$ composer update`

### Git
* Commit
  * composer.json - Contains all project info. "Rough" guide to versions that should be installed.
  * composer.lock - Exact record of all versions installed.
* Do not commit, if possible
  * ./vendor
  * ./web/core
  * ./web/modules/contrib
  * ./web/themes/contrib

### Project Setup
#### Drupal 7
* `composer create-project drupal-composer/drupal-project:7.x-dev -n <project_dir>`
#### Drupal 8/9
* Set up local.services.yml
  * Enable twig debug
  parameters:
    twig.config:
      debug: true
* Set up settings.php
  * Update $settings['trusted_host_patterns']
  * Move $settings['config_sync_directory'] out of docroot
* Set up settings.local.php
  * Update container_yamls to use local.services.yml
  * Disable the render cache
  * Disable Dynamic Page Cache
  * Allow test modules and themes to be installed
  * Add override of $settings['trusted_host_patterns'] if needed.
  * Enable access to rebuild.php 
  
### DDev
* `$ ddev config`
* `$ ddev start`


# todo
3. custom modules/themes
