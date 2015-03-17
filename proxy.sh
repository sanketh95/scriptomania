#!/bin/sh

DEFAULT_PORT="3128"

if [ "$#" = 0 ]
then
	`gsettings set org.gnome.system.proxy mode 'none'`
	exit
fi

`gsettings set org.gnome.system.proxy mode 'manual'`
`gsettings set org.gnome.system.proxy.http host $1`
`gsettings set org.gnome.system.proxy.https host $1`
`gsettings set org.gnome.system.proxy.ftp host $1`
`gsettings set org.gnome.system.proxy.socks host $1`
if [ "$#" -gt 1 ]
then
	`gsettings set org.gnome.system.proxy.http port $2`
	`gsettings set org.gnome.system.proxy.https port $2`
	`gsettings set org.gnome.system.proxy.ftp port $2`
	`gsettings set org.gnome.system.proxy.socks port $2`
else
	`gsettings set org.gnome.system.proxy.http port $DEFAULT_PORT`
	`gsettings set org.gnome.system.proxy.https port $DEFAULT_PORT`
	`gsettings set org.gnome.system.proxy.ftp port $DEFAULT_PORT`
	`gsettings set org.gnome.system.proxy.socks port $DEFAULT_PORT`
fi

if [ "$#" = 4 ]
then
	`gsettings set org.gnome.system.proxy.http authentication-user $3`
	`gsettings set org.gnome.system.proxy.http authentication-password $4`
fi