#!/bin/bash

if systemctl is-active --quiet "apache2.service" ; then
  systemctl stop apache2
fi