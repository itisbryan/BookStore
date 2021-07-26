#!/bin/bash

# Check if MySQL is running
sudo service mysql status > /dev/null 2>&1

# Restart Mysql service if it's not running
# shellcheck disable=SC2181
if [ $? != 0 ]; then
  sudo service mysql restart
fi