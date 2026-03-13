#!/bin/bash

# Configuration
# set these in ~/.config/environment.d/openweathermap-envvars.conf
. ~/.config/environment.d/openweathermap-envvars.conf
API_KEY=$OPENWEATHERMAP_API_KEY
CITY_ID=$OPENWEATHERMAP_CITY_ID
UNITS="metric"
LANG="en"

CACHE_FILE="$HOME/.cache/waybar_openweathermap"
MAX_AGE=600 # 10 minutes

now=$(date +%s)
if [[ -f "$CACHE_FILE" ]]; then
    last_modified=$(stat -c %Y "$CACHE_FILE")
    age=$(( now - last_modified ))

    if (( age < MAX_AGE )) ; then
        cat "$CACHE_FILE"
        exit 0
    fi
fi

# Function to check if API key is valid
check_api_key() {
    local test_request=$(curl -s "api.openweathermap.org/data/2.5/weather?q=London&appid=$API_KEY")
    if [[ $test_request == *"Invalid API key"* ]]; then
        echo "󰖙 Invalid API key"
        
        exit 1
    fi
}

# Function to get weather icon based on conditions and time
get_icon() {
    local condition=$1
    local is_day=$2
    
    case $condition in
        "Clear")
            if [ "$is_day" = "true" ]; then
                echo "󰖙"  # Clear day
            else
                echo "󰖔"  # Clear night
            fi
            ;;
        "Clouds")
            case $3 in
                "few clouds") echo "󰖕" ;;  # Few clouds
                "scattered clouds") echo "󰖕" ;;  # Scattered clouds
                *) echo "󰖐" ;;  # Cloudy
            esac
            ;;
        "Rain")
            if [[ $3 == *"light"* ]]; then
                echo "󰖖"  # Light rain
            else
                echo "󰖗"  # Rain
            fi
            ;;
        "Drizzle")
            echo "󰖖"  # Drizzle
            ;;
        "Thunderstorm")
            echo "󰖓"  # Thunderstorm
            ;;
        "Snow")
            echo "󰖘"  # Snow
            ;;
        "Mist"|"Fog"|"Haze")
            echo "󰖑"  # Mist
            ;;
        *)
            echo "󰖜"  # Default icon
            ;;
    esac
}

# Check API key first
check_api_key

# Get weather data
WEATHER_DATA=$(curl -s "api.openweathermap.org/data/2.5/weather?id=$CITY_ID&appid=$API_KEY&units=$UNITS&lang=$LANG")

if [ -n "$WEATHER_DATA" ]; then
    # Extract data
    TEMP=$(echo $WEATHER_DATA | jq -r '.main.temp')
    DESCRIPTION=$(echo $WEATHER_DATA | jq -r '.weather[0].main')
    DETAILED_DESC=$(echo $WEATHER_DATA | jq -r '.weather[0].description')
    FEELS_LIKE=$(echo $WEATHER_DATA | jq -r '.main.feels_like')
    SUNRISE=$(echo $WEATHER_DATA | jq -r '.sys.sunrise')
    SUNSET=$(echo $WEATHER_DATA | jq -r '.sys.sunset')
    
    # Determine if it's day or night
    CURRENT_TIME=$(date +%s)
    IS_DAY="true"
    if [ $CURRENT_TIME -lt $SUNRISE ] || [ $CURRENT_TIME -gt $SUNSET ]; then
        IS_DAY="false"
    fi
    
    # Round temperatures
    TEMP=$(printf "%.0f" $TEMP)
    FEELS_LIKE=$(printf "%.0f" $FEELS_LIKE)
    
    # Get weather icon
    ICON=$(get_icon "$DESCRIPTION" "$IS_DAY" "$DETAILED_DESC")
    
    # Format output
    echo "$ICON $TEMP°C ($FEELS_LIKE°C)" > "$CACHE_FILE"
    cat "$CACHE_FILE"
else
    echo "󰖙 Weather unavailable"
fi
