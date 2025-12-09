#!/usr/bin/env bash
IFACE="wlan0"
CACHE="/tmp/genmon_${IFACE}_cache"

# Read current counters
read -r _ RX _ _ _ _ _ _ _ TX _ <<< "$(grep $IFACE /proc/net/dev | tr ':' ' ')"

# If no cache → store and exit
if [ ! -f "$CACHE" ]; then
    echo "$RX $TX" > "$CACHE"
    echo "<txt>↓0 kB/s ↑0 kB/s</txt>"
    echo "<tool>No previous data</tool>"
    exit
fi

# Read previous values
read -r RX_PREV TX_PREV < "$CACHE"

# Save new counters
echo "$RX $TX" > "$CACHE"

# Compute deltas
DRX=$((RX - RX_PREV))
DTX=$((TX - TX_PREV))

# Convert to kB/s (Genmon interval = 1 second)
RX_KB=$((DRX / 1024))
TX_KB=$((DTX / 1024))

# Output to Genmon
INFO="<txt>"
INFO+="↓<span fgcolor='red' weight='Bold'> ${RX_KB} kB/s</span> "
INFO+="↑<span fgcolor='green' weight='Bold'> ${TX_KB} kB/s</span>"
INFO+="</txt>"

TOOL="<tool>"
TOOL+="Download: ${RX_KB} kB/s\nUpload: ${TX_KB} kB/s"
TOOL+="</tool>"

echo -e "$INFO"
echo -e "$TOOL"
