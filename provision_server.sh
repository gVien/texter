#!/bin/bash

APP_LOCALE=/var/www/texter

chmod +x $APP_LOCALE/setup_puma.sh
chmod +x $APP_LOCALE/setup_node.sh
chmod +x $APP_LOCALE/setup_apache.sh

sh $APP_LOCALE/setup_puma.sh && $APP_LOCALE/setup_node.sh && $APP_LOCALE/setup_apache.sh
