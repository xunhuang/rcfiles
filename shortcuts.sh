#!/bin/bash

  # Get the name of the active application using AppleScript
  front_app=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true')

  # Check if the active application is Google Chrome
  if [ "$front_app" == "Google Chrome" ]; then
  # if [ "$front_app" == "Terminal" ]; then
    # Get the URL of the active tab in Google Chrome
    active_url=$(osascript -e 'tell application "Google Chrome" to get URL of active tab of front window')
    echo "The active application is Google Chrome."
    echo "The active URL is: $active_url"
    if [[ "$active_url" == https://mail.google.com* ]]; then
        /usr/bin/qlmanage -p ~/projects/rcfiles/shortcuts-gmail.md 
    elif [[ "$active_url" == https://docs.google.com/document* ]]; then
        /usr/bin/qlmanage -p ~/projects/rcfiles/shortcuts-docs.md 
    elif [[ "$active_url" == https://docs.google.com/spreadsheets* ]]; then
        /usr/bin/qlmanage -p ~/projects/rcfiles/shortcuts-sheets.md 
    else
        /usr/bin/qlmanage -p ~/projects/rcfiles/shortcuts.md 
    fi
  elif [ "$front_app" == "Notes" ]; then
    /usr/bin/qlmanage -p ~/projects/rcfiles/shortcuts-notes.md 
  else
    echo "The active application is: $front_app"
    /usr/bin/qlmanage -p ~/projects/rcfiles/shortcuts.md 
  fi