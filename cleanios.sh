#!/bin/bash

ios_device_cleanup() {
    # remove all user-installed apps
    local IFS=', '  # the app list has comma-separated records, one per line
    while read app_record; do
        items=($app_record)
        app_id=${items[0]}
        ideviceinstaller --uninstall $app_id
    done < <( ideviceinstaller --list-apps | tail -n+2 )
}

ios_device_cleanup
