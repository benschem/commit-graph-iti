#!/bin/bash

date="2024-01-01"

for day in {1..43} ; do
    cd /home/admin/commit-graph-iti

    random_number=$((1 + RANDOM % 100))

    if [ "$random_number" -gt 40 ]; then
          git add .
          git commit --allow-empty -m "cheeky commit history rewrite" --date="$date 11:11:11"  
          echo "committed on $date"
    else
      echo "no commit on $date"
    fi
    date=$(date -d "$date + 1 day" +'%Y-%m-%d')
done

git push origin main
