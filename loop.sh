#!/bin/bash
while true
do
  echo "running at `date`"
  git pull
  ./update.sh
  sleep 3600
done
