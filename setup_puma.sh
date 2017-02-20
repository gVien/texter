#!/bin/bash

PUMA_FOLDER=/var/run/puma
APP_LOCALE=/var/www/texter

if [ ! -d "$PUMA_FOLDER" ]; then
  # if puma folder doesn't exist do
  mkdir $PUMA_FOLDER
  touch $PUMA_FOLDER/puma.pid
else
  touch $PUMA_FOLDER/puma.pid
fi

touch $APP_LOCALE/puma.rb

cat << EOF > $APP_LOCALE/puma.rb
environment ENV['RAILS_ENV'] || 'production'
daemonize

threads 0, 16

pidfile '/var/run/puma/puma.pid'
EOF

mv $APP_LOCALE/puma /etc/init.d/
chmod +x /etc/init.d/puma
