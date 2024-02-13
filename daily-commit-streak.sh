#!/bin/bash -e

cd /home/admin/commit-graph-iti

LOG_FILE="/error.log"
today=`date +'%Y-%m-%d %T'`


log_error() {
    echo "ERROR - [$today] $1" >> "$LOG_FILE"
}

cleanup() {
    local exit_status=$?
    log_error "Error occurred on line $1."
    exit $exit_status
}
trap 'cleanup $LINENO' ERR

random_number=$((1 + RANDOM % 100))
percent_chance_of_committing=60
commit_today=$((random_number > (100 - percent_chance_of_committing)))

if [ "$commit_today" = true ]; then
    git add .
    git commit --allow-empty -m "cheeky commit history rewrite" --date="$today"  
    echo "INFO - [$today] Committed successfully." >> "$LOG_FILE"
else
    echo "INFO - [$today] No commit made." >> "$LOG_FILE"
fi

git push origin main
