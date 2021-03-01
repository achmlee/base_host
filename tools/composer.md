# Composer (Last Updated: 2020.11.30)

## Reference
* @see https://getcomposer.org/download/
* phar = PHP archive file

## Requirements
* `$ sudo apt-get install php-cli`

## Sub-Requirements (most likely needed)
* `$ sudo apt-get install php7.3-curl`

## Setup (non CURL based install)

### Create the composer.phar file
* `$ php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"`
* `$ php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"`
* `$ php composer-setup.php`
* `$ php -r "unlink('composer-setup.php');"`

### Global install (Make composer.phar globally accessible)
* `$ mv composer.phar /usr/local/bin/composer`

### Commands
* `$ composer install` - First time setup, creates composer.lock file.
* `$ composer install` - If new package added, addes new package and updates composer.lock.
* `$ composer update` - Updates all version to latest and updates composer.lock file. Best to do at start of sprint.
* `$ composer update package/name` - Updates specific package version and updates composer.lock file.
* `$ composer update --with-dependencies package/name` - Updates with dependencies as well, not just the package. Better option.
