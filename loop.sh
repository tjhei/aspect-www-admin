#!/bin/bash
while true
do
  echo "running at `date`"
  git pull
  ./update.sh
  echo "sleeping..."
  sleep 3600
done
