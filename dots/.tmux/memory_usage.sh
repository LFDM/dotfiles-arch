#!/usr/bin/env bash
set -euo pipefail

mem_info=$(awk '
/MemTotal:/ { total = $2 }
/MemAvailable:/ { available = $2 }
END {
  used = total - available
  printf "%.1fG/%.1fG %2.0f%%\n", used / 1048576, total / 1048576, (used / total) * 100
}
' /proc/meminfo)

printf "%s" "$mem_info"
