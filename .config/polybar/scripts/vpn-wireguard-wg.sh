#!/bin/sh


# You have to add the wg and wg-quick command to the /etc/sudoers NOPASSWD of your user:
#
# user ALL=(ALL) NOPASSWD: /usr/bin/wg
# user ALL=(ALL) NOPASSWD: /usr/bin/wg-quick

connection_status() {
    if [ -f "$config" ]; then
        connection=$(sudo wg show "$config_name" 2>/dev/null | head -n 1 | awk '{print $NF }')

        if [ "$connection" = "$config_name" ]; then
            echo "1"
        else
            echo "2"
        fi
    else
        echo "3"
    fi
}

config="$HOME/Wireguard/wireguard.conf"
config_name="wireguard"

case "$1" in
--toggle)
    if [ "$(connection_status)" = "1" ]; then
        sudo wg-quick down "$config" 2>/dev/null
    else
        sudo wg-quick up "$config" 2>/dev/null
    fi
    ;;
*)
    if [ "$(connection_status)" = "1" ]; then
        echo "#1 $config_name"
    elif [ "$(connection_status)" = "3" ]; then
        echo "#3 Config not found!"
    else
        echo "#2 down"
    fi
    ;;
esac
