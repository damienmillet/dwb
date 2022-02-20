# DevWebBundle

node + composer


# Php
Php is installed by default with Composer, actually the version 8.0
the php command don't working cause actualy the LTS is 7.4 and isn't installed.
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

# Symfony
Symfony don't need apache for work, so just initialize php and run :
For use only apache with php, initialize php and the following apache script : 
```sh
# /dwb/scripts/symfony.sh
```

Enjoy ;)
