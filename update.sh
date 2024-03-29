#!/bin/bash
TEMP_DIR=/tmp/new-wiki
MAJOR_VERSION=1.38
MINOR_VERSION=4
FULL_VERSION=$MAJOR_VERSION.$MINOR_VERSION
FULL_NAME=mediawiki-$FULL_VERSION

mkdir -pv $TEMP_DIR
cd $TEMP_DIR || exit 1
wget https://releases.wikimedia.org/mediawiki/$MAJOR_VERSION/$FULL_NAME.tar.gz
tar -xvzf $FULL_NAME.tar.gz
rm $FULL_NAME.tar.gz
cd $TEMP_DIR/$FULL_NAME || exit 1
cp /var/www/html/mediawiki/LocalSettings.php .
cp -r /var/www/html/mediawiki/images/ .
cp -r /var/www/html/mediawiki/extensions/ .
cp -r /var/www/html/mediawiki/resources/assets/* ./resources/assets/
mv $TEMP_DIR/$FULL_NAME /var/www/html/
unlink /var/www/html/mediawiki
ln -s /var/www/html/$FULL_NAME /var/www/html/mediawiki
