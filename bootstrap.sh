#!/usr/bin/env bash
if [ -n "$SERVICENAME" ]; then
	sed -i \
		-e "s/REPLACE_BACKEND/$SERVICENAME/g" \
		-e "s/REPLACE_PORT/$SERVICEPORT/g" \
		/usr/local/etc/haproxy/haproxy.cfg
else
	sed -i \
		-e "s/REPLACE_BACKEND/www/g" \
		-e "s/REPLACE_PORT/80/g" \
		/usr/local/etc/haproxy/haproxy.cfg
fi

/certs.sh && supervisord -n
