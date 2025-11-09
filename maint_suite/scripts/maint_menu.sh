
#!/bin/bash
set -euo pipefail
source "$(dirname "$0")/lib_common.sh"

SCRIPTDIR="$HOME/maint_suite/scripts"

while true; do
  echo "========== Maintenance Menu =========="
  echo "1) Run Backup"
  echo "2) Run System Maintenance"
  echo "3) Run Log Monitor"
  echo "4) Run All"
  echo "5) View Logs"
  echo "6) Exit"
  read -rp "Enter your choice: " choice

  case $choice in
    1) bash "$SCRIPTDIR/backup.sh" ;;
    2) bash "$SCRIPTDIR/system_maint.sh" ;;
    3) bash "$SCRIPTDIR/log_monitor.sh" ;;
    4)
       bash "$SCRIPTDIR/backup.sh"
       bash "$SCRIPTDIR/system_maint.sh"
       bash "$SCRIPTDIR/log_monitor.sh"
       ;;
    5)
       echo "Available logs:"
       ls "$HOME/maint_suite/maint_logs"
       read -rp "Enter log filename to view: " lf
       less "$HOME/maint_suite/maint_logs/$lf"
       ;;
    6) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid option." ;;
  esac
  echo
done
