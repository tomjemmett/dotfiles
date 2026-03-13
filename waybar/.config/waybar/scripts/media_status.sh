#!/usr/bin/env bash

VISIBLE_LENGTH=30  # Number of characters to display at once (adjust this for your display width)

# STATUS=$(playerctl status)
# METADATA=$(playerctl metadata --format "{{ artist }} - {{ title }}")
# 
# # Map the status to Font Awesome icons
# case "$STATUS" in
#     "Playing")
#         ICON=""  # fa-play
#         ;;
#     "Paused")
#         ICON=""  # fa-pause
#         ;;
#     "Stopped")
#         ICON=""  # fa-stop
#         ;;
#     "No media player found")
#         ICON="&#xf12a;"  # fa-exclamation-circle
#         ;;
#     "Error")
#         ICON=""  # fa-times-circle
#         ;;
#     *)
#         ICON=""  # fa-question-circle (fallback for unexpected status)
#         ;;
# esac
# 
# # Get the current song metadata (Artist - Title)gg
# METADATA=$(playerctl metadata --format "{{ artist }} - {{ title }}")
# 
# # Initialize the starting index for scrolling
# TEXT_LENGTH=${#METADATA}
# 
# # Loop to scroll the text continuously
# while true; do
#     DISPLAY_TEXT="${METADATA:0:$VISIBLE_LENGTH}"
#     echo "{\"text\": \"$ICON $DISPLAY_TEXT\"}"
#     sleep 1
#     # Scroll the text one character at a time
#     for (( i=1; i<=$((TEXT_LENGTH - VISIBLE_LENGTH)); i++ )); do
#         # Get a substring from position i to i+VISIBLE_LENGTH
#         DISPLAY_TEXT="${METADATA:$i:$VISIBLE_LENGTH}"
# 
#         # Output the scrolled text (for Waybar)
#         echo "{\"text\": \"$ICON $DISPLAY_TEXT\"}"
# 
#         # Sleep for smooth scrolling effect
#         sleep 0.1  # Adjust this value for faster/slower scrolling
#     done
#     sleep 3
# done


get_status() {
    STATUS=$(playerctl status)
    case "$STATUS" in
        "Playing")
            ICON=""  # fa-play
            ;;
        "Paused")
            ICON=""  # fa-pause
            ;;
        "Stopped")
            ICON=""  # fa-stop
            ;;
        "No media player found")
            ICON=""  # fa-exclamation-circle
            ;;
        "Error")
            ICON=""  # fa-times-circle
            ;;
        *)
            ICON=""  # fa-question-circle (fallback for unexpected status)
            ;;
    esac

    echo $ICON
}

# Function to fetch and display the current metadata
update_metadata() {
    METADATA=$(playerctl metadata --format "{{ artist }} - {{ title }}")
    TEXT_LENGTH=${#METADATA}

    if [[ -z "$METADATA" ]]; then
        METADATA="No media playing"
        TEXT_LENGTH=${#METADATA}
        exit
    fi

    ICON=$(get_status)
    DISPLAY_TEXT="${METADATA:0:$VISIBLE_LENGTH}"
    echo "{\"text\": \"$ICON $DISPLAY_TEXT\"}"
    sleep 1
    # Scroll the text one character at a time
    for (( i=1; i<=$((TEXT_LENGTH - VISIBLE_LENGTH)); i++ )); do
        # Get a substring from position i to i+VISIBLE_LENGTH
        DISPLAY_TEXT="${METADATA:$i:$VISIBLE_LENGTH}"

        # Output the scrolled text (for Waybar)
        echo "{\"text\": \"$ICON $DISPLAY_TEXT\"}"

        # Sleep for smooth scrolling effect
        sleep 0.1  # Adjust this value for faster/slower scrolling
    done
}

# Listen for playerctl events and update status dynamically
playerctl --follow status | while read -r event; do
    if [[ $(playerctl status) == "No players found" ]]; then
        echo "{\"text\": \"No players found\"}"   
    else
        playerctl --follow metadata | while read -r event; do
            # Update the metadata and display
            update_metadata
            sleep 3
        done
    fi
done
