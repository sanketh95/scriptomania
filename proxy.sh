#!/bin/sh

DEFAULT_PORT="3128"

if [ "$#" = 0 ]
then
	`gsettings set org.gnome.system.proxy mode 'none'`
	exit
fi

`gsettings set org.gnome.system.proxy mode 'manual'`
`gsettings set org.gnome.system.proxy.http enabled true`
`gsettings set org.gnome.system.proxy.http host $1`
if [ "$#" -gt 1 ]
then
	`gsettings set org.gnome.system.proxy.http port $2`
else
	`gsettings set org.gnome.system.proxy.http port $DEFAULT_PORT`
fi
`gsettings set org.gnome.system.proxy use-same-proxy true`

if [ "$#" = 4 ]
then
	`gsettings set org.gnome.system.proxy.http authentication-user $3`
	`gsettings set org.gnome.system.proxy.http authentication-password $4`
fi