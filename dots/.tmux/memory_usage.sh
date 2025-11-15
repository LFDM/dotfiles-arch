#!/usr/bin/env bash
set -euo pipefail

mem_pct=$(awk '
/MemTotal:/ { total = $2 }
/MemAvailable:/ { available = $2 }
END {
  if (total == 0) {
    print "0"
    exit
  }
  printf "%.0f", ((total - available) / total) * 100
}
' /proc/meminfo)

read -r _ user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
prev_total=$((user + nice + system + idle + iowait + irq + softirq + steal))
prev_idle=$((idle + iowait))

sleep 0.2

read -r _ user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
total=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle_total=$((idle + iowait))

delta_total=$((total - prev_total))
delta_idle=$((idle_total - prev_idle))

cpu_pct=$(awk -v total="$delta_total" -v idle="$delta_idle" '
BEGIN {
  if (total <= 0) {
    print "0"
    exit
  }
  printf "%.0f", (1 - (idle / total)) * 100
}')

printf "Mem %s%% CPU %s%%" "$mem_pct" "$cpu_pct"
