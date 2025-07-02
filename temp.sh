#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <city>"
  exit 1
fi

CITY=$1
OUTPUT_FILE="/var/www/html/index.html"

WEATHER_DATA=$(curl -s "wttr.in/${CITY}?format=j1")
TEMP=$(echo "$WEATHER_DATA" | jq '.current_condition[0].temp_C')
HUMIDITY=$(echo "$WEATHER_DATA" | jq '.current_condition[0].humidity')

cat <<EOF > "$OUTPUT_FILE"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Weather in $CITY</title>
</head>
<body>
    <h1>Current Weather in $CITY</h1>
    <p>Temperature: $TEMP °C</p>
    <p>Humidity: $HUMIDITY %</p>
</body>
</html>
EOF
