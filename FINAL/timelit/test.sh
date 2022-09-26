#!/bin/bash
UTC=$(env TZ=Europe/Amsterdam date -R +"%H%M"); 
echo $UTC
MinuteOTheDay=$((UTC+200));
echo $MinuteOTheDay
