# PHP
apk update
php_version=$(apk info | grep -E "^php(.*)-" -m 1 | cut -d '-' -f 1 | sed 's#\.##g' | cut -c 1-5)
# confirmer la version php ou demander à l'utilisateur
apk add --no-cache \
    ${php_version}-pecl-xdebug ${php_version}-ctype ${php_version}-pecl-mongodb \
    ${php_version}-session ${php_version}-tokenizer ${php_version}-simplexml \
    ${php_version}-intl ${php_version}-posix ${php_version}-dom ${php_version}-xml \
    ${php_version}-pdo_mysql ${php_version}-pdo_pgsql ${php_version}-opcache ${php_version}-xmlwriter

ln -s /usr/bin/${php_version} /usr/bin/php

sed -i 's#;date.timezone=#date.timezone=Europe/Paris#' /etc/${php_version}/php.ini && \
sed -i 's#;opcache.enable=1#opcache.enable=1#' /etc/${php_version}/php.ini && \
sed -i 's#;opcache.enable_cli=0#opcache.enable_cli=1#' /etc/${php_version}/php.ini && \
sed -i 's#;opcache.memory_consumption=128#opcache.memory_consumption=128#' /etc/${php_version}/php.ini && \
sed -i 's#;opcache.revalidate_freq=2#opcache.revalidate_freq=0#' /etc/${php_version}/php.ini && \
sed -i 's#;realpath_cache_size = 4096k#realpath_cache_size = 4096k#' /etc/${php_version}/php.ini && \
sed -i 's#;realpath_cache_ttl = 120#realpath_cache_ttl = 7200#' /etc/${php_version}/php.ini && \
sed -i 's#upload_max_filesize = 2M#upload_max_filesize = 100M#' /etc/${php_version}/php.ini && \
sed -i 's#post_max_size = 8M#post_max_size = 128M#' /etc/${php_version}/php.ini && \
sed -i 's#memory_limit = 128M#memory_limit = 256M#' /etc/${php_version}/php.ini && \
sed -i 's#session.cookie_httponly =#session.cookie_httponly = true#' /etc/${php_version}/php.ini && \
sed -i 's#display_errors = Off#display_errors = On#' /etc/${php_version}/php.ini && \
sed -i 's#display_startup_errors = Off#display_startup_errors = On#' /etc/${php_version}/php.ini && \
sed -i 's#error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT#error_reporting = E_ALL#' /etc/${php_version}/php.ini && \
sed -i 's#;zend_extension=xdebug.so#zend_extension=xdebug.so#' /etc/${php_version}/conf.d/50_xdebug.ini && \
sed -i 's#;xdebug.mode=off#xdebug.mode=on#' /etc/${php_version}/conf.d/50_xdebug.ini && \
echo "xdebug.color = 1" >> /etc/${php_version}/conf.d/50_xdebug.ini

echo "export PATH=/root/.composer/vendor/bin:$PATH" >> /etc/profile

# composer global require phing/phing
# composer global require phpdocumentor/phpdocumentor
# composer global require sebastian/phpcpd
# composer global require phploc/phploc
# composer global require phpmd/phpmd
# composer global require squizlabs/php_codesniffer

# Install PhpUnit
version=$(git ls-remote --refs --sort="version:refname" --tags https://github.com/sebastianbergmann/phpunit | cut -d/ -f3-|tail -n1 )
wget https://phar.phpunit.de/phpunit-${version}.phar -O /tmp/phpunit.phar
chmod +x /tmp/phpunit.phar
mv /tmp/phpunit.phar /usr/local/bin/phpunit

