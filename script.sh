#!/bin/bash

# check for Internet
if ! ping -c 1 -W 2 -q www.google.com > /dev/null 2>&1; then
  printf "There appears to be no Internet connection. Exiting...\n" >&2
  exit 1
fi

# verify curl and dig are installed on system
if ! command -v curl 1> /dev/null; then
  printf "'curl' must be installed on your system. Exiting...\n" 1>&2
  exit 1
fi
if ! command -v dig 1> /dev/null; then
  printf "'dig', part of the 'dnsutils' package, must be installed on your system. Exiting...\n" 1>&2
  exit 1
fi

# Function to validate the URL
validate_url(){
  if [[ $1 =~ ^http(s)?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}(/.*)?$ ]]; then
    echo "true"
  else
    echo "false"
  fi
}

# Function to validate the number of repetitions
validate_repetitions(){
  if [[ $1 =~ ^[0-9]+$ ]] && [ $1 -le 100000 ]; then
    echo "true"
  else
    echo "false"
  fi
}

# Function to validate the delay
validate_delay(){
  if [[ $1 =~ ^[0-9]+$ ]] && [ $1 -ge 1 ]; then
    echo "true"
  else
    echo "false"
  fi
}

# Prompt user for the website URL
read -p "Enter the website URL: " URL

# Validate the URL
if [ $(validate_url $URL) == "false" ]; then
  echo "Invalid URL. Please enter a valid URL starting with http:// or https://"
  exit 1
fi

# Prompt user for the number of repetitions
read -p "Enter the number of repetitions (up to 100000): " REPETITIONS

# Validate the number of repetitions
if [ $(validate_repetitions $REPETITIONS) == "false" ]; then
  echo "Invalid number of repetitions. Please enter a number up to 100000."
  exit 1
fi

# Prompt user for the delay between visits
read -p "Enter the delay between visits in seconds (minimum 1 second): " DELAY

# Validate the delay
if [ $(validate_delay $DELAY) == "false" ]; then
  echo "Invalid delay. Please enter a number greater than or equal to 1."
  exit 1
fi

# Loop to visit the website the specified number of times with the specified delay
for (( i=1; i<=REPETITIONS; i++ ))
do
  curl $URL > /dev/null 2>&1
  echo "Visited $URL - Count: $i"
  sleep $DELAY
done

echo "Completed visiting $URL for $REPETITIONS times with a delay of $DELAY seconds."
