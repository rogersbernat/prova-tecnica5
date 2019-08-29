#!/usr/bin/env bash

sudo apt-get update && sudo apt-get upgrade -y

GOOGLE_APPLICATION_CREDENTIALS="/etc/google/auth/application_default_credentials.json"
sudo mkdir -p $(dirname "$GOOGLE_APPLICATION_CREDENTIALS")
sudo mv "$HOME/temp.json" "$GOOGLE_APPLICATION_CREDENTIALS"

curl -sSO https://dl.google.com/cloudagents/install-monitoring-agent.sh
sudo bash install-monitoring-agent.sh

ps ax | grep fluentd
ps ax | grep collectd