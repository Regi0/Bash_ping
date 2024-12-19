#!/bin/bash

# Configuration
HOSTS_FILE="/home/regi/Bash_ping/hosts.txt"                 # File containing the list of hosts (one per line)
OUTPUT_DIR="/home/regi/Bash_ping/Advanced_results"                   # Directory to store output files
PING_COUNT=3                                   # Number of ping attempts per host

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Get the current timestamp for the output file
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="$OUTPUT_DIR/ping_results_$TIMESTAMP.txt"

# Check if the hosts file exists
if [[ ! -f "$HOSTS_FILE" ]]; then
    echo "Error: Hosts file '$HOSTS_FILE' not found."
    exit 1
fi

# Ping each host and write results to the output file
while IFS= read -r host || [[ -n "$host" ]]; do
    if [[ -n "$host" ]]; then
        echo "Pinging $host..." >> "$OUTPUT_FILE"
        ping -DOUvT tsprespec -c "$PING_COUNT" "$host" >> "$OUTPUT_FILE" 2>&1
        echo -e "\n----- Separator -----\n" >> "$OUTPUT_FILE"
    fi
done < "$HOSTS_FILE"

echo "Ping results saved to $OUTPUT_FILE"
