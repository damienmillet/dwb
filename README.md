# DevWebBundle

node + composer


# Php
Php is installed by default with Composer, actually 8.0

the php's command don't working cause actualy the LTS is 7.4 and isn't installed.

for complete the installation of php8 and create a symbolic link to php juste run :

```sh
# /dwb/scripts/php.sh
```


# Apache

For use only apache with php, initialize php and the following apache script : 

```sh
# /dwb/scripts/apache.sh
```

Actually the rootFolder is /var/www but ll change to /app, the service isn't load at start.

Simple run it with

```sh
# httpd -k stop stops Apache
# httpd -t tests the validity of the configuration
# httpd -k start -e debug starts Apache again with the log level set to debug.
```

# Symfony

Symfony don't need apache for work, so just initialize php and run :

For use only apache with php, initialize php and the following apache script : 

```sh
# git config --global user.email "contact@damien-millet.dev"
# git config --global user.name "damienmillet"
# apk add github-cli && gh auth login # if private repository
# /dwb/scripts/symfony.sh
```

Enjoy ;)
