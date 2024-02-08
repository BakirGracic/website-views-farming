#!/bin/bash

# Exit on any error
set -e

# Check for Internet by pinging Google's DNS
if ! ping -c 1 -W 2 -q 8.8.8.8 > /dev/null 2>&1; then
  printf "There appears to be no Internet connection. Exiting...\n" >&2
  exit 1
fi

# Verify curl is installed on system
if ! command -v curl &> /dev/null; then
  printf "'curl' must be installed on your system. Exiting...\n" >&2
  exit 1
fi

# URL validation via regex function
validate_url() {
  local url=$1
  local regex='^(https?://)?([a-z0-9-]+\.)*[a-z0-9-]+\.[a-z]{2,}(/.*)?$'
  [[ $url =~ $regex ]]
}

# Number of repetitions validation function
validate_repetitions() {
  local repetitions=$1
  if [[ $repetitions =~ ^[0-9]+$ ]] && [ $repetitions -le 100000 ]; then
    return 0
  else
    return 1
  fi
}

# Delay validation function
validate_delay() {
  local delay=$1
  if [[ $delay =~ ^[0-9]+$ ]] && [ $delay -ge 1 ]; then
    return 0
  else
    return 1
  fi
}

# Prompt for website URL
read -p "Enter the website URL: " URL
if ! validate_url "$URL"; then
  echo "Invalid URL. Please enter a valid URL."
  exit 1
fi

# Prompt for number of repetitions
read -p "Enter the number of repetitions (up to 100000): " REPETITIONS
if ! validate_repetitions "$REPETITIONS"; then
  echo "Invalid number of repetitions. Please enter a number up to 100000."
  exit 1
fi

# Prompt for delay
read -p "Enter the delay between visits in seconds (minimum 1 second): " DELAY
if ! validate_delay "$DELAY"; then
  echo "Invalid delay. Please enter a number greater than or equal to 1."
  exit 1
fi

# Main loop
for (( i=1; i<=REPETITIONS; i++ ))
do
  if curl -s -o /dev/null -f "$URL"; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Visited $URL - Count: $i"
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Failed to visit $URL - Count: $i"
  fi
  sleep "$DELAY"
done

echo "Completed visiting $URL for $REPETITIONS times with a delay of $DELAY seconds."
