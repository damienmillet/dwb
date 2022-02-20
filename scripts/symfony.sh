# # Install Symfony

# git config --global user.email "contact@damien-millet.dev"
# git config --global user.name "damienmillet"
# /dwb/scripts/php.sh

arch=$(uname -m)
version=$(git ls-remote --refs --sort="version:refname" --tags https://github.com/symfony-cli/symfony-cli | cut -d/ -f3-|tail -n1 | cut -c 2- )

wget https://github.com/symfony-cli/symfony-cli/releases/download/v${version}/symfony-cli_${version}_${arch}.apk -O /tmp/symfony-cli.apk
apk add /tmp/symfony-cli.apk --no-cache --allow-untrusted
rm /tmp/symfony-cli.apk

# ssl
symfony server:ca:install
