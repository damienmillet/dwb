# apache2

# install
apk update
php_version=$(apk info | grep -E "^php(.*)-" -m 1 | cut -d '-' -f 1 | sed 's#\.##g' | cut -c 1-5)
# confirmer la version php ou demander à l'utilisateur
/dwb/scripts/php.sh
apk add --no-cache ${php_version}-apache2 apache2-ssl

# configuration
echo """
# Include generic snippets of statements
IncludeOptional conf.d/conf-enabled/*.conf

# Include the virtual host configurations:
IncludeOptional conf.d/sites-enabled/*.conf
""" >> /etc/apache2/httpd.conf

sed -i 's/#ServerName www.example.com:80/ServerName www.example.com:80/' /etc/apache2/httpd.conf
sed -i 's@ServerRoot /var/www/@#ServerRoot /app@' /etc/apache2/httpd.conf

mkdir /etc/apache2/conf.d/sites-available
mkdir /etc/apache2/conf.d/conf-available

cp /dwb/config/vhost.conf /etc/apache2/conf.d/sites-available/000-default.conf
cp /dwb/config/apache2.conf /etc/apache2/conf.d/conf-available/z-app.conf

### Service
httpd
