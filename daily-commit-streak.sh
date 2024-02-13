#!/bin/bash -e

# Replace the path with the location of your repo
git_repo='/home/admin/commit-graph-iti'
cd "$git_repo"

LOG_FILE="/error.log"
today=`date +'%Y-%m-%d %T'`

log_error() {
    echo "ERROR - [$today] $1" >> "$LOG_FILE"
}

cleanup() {
    local exit_status=$?
    log_error "Error occurred on line $1."
    exit "$exit_status"
}
trap 'cleanup $LINENO' ERR

random_number=$((1 + RANDOM % 100)) # between 1..100

# Edit this number to set the chance of making a commit that day as a percentage
percent_chance_of_committing=60

# Edit this number to change the maximum number of commits to make per day
max_number_of_commits=3

commit_today=$((random_number > (100 - percent_chance_of_committing)))
number_of_commits=$((1 + RANDOM % max_number_of_commits))

if [ "$commit_today" -eq 1 ]; then
    for i in $(seq "$number_of_commits"); do
        git add .
        git commit --allow-empty -m "cheeky automated commit for the graph"
        echo "INFO - [$today] Committed successfully." >> "$LOG_FILE"
    done
else
    echo "INFO - [$today] No commit made." >> "$LOG_FILE"
fi

git push origin main
