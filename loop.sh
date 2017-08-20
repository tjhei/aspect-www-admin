#!/bin/bash
while true
do
  echo "running at `date`"
  ./update.sh
  sleep 3600
done
