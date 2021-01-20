#!/usr/bin/env bash
set -o nounset # Treat unset variables as an error

### timezone: Set the timezone for the container
timezone="$TMZ"
[[ -e /usr/share/zoneinfo/$timezone ]] || {
    echo "ERROR: invalid timezone specified: $timezone" >&2
    return
}

if [[ -w /etc/timezone && $(cat /etc/timezone) != $timezone ]]; then
    echo "$timezone" >/etc/timezone
    ln -sf /usr/share/zoneinfo/$timezone /etc/localtime
    dpkg-reconfigure -f noninteractive tzdata >/dev/null 2>&1
fi

# Start Nginx
exec nginx -g "daemon off;"