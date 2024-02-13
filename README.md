# commit-graph-iti
*Have some fun with the GitHub commit graph.*
##graph-iti.sh
A bash script that spells 'HIRE ME PLS' on the git commit graph using empty commits to this repository.
Each time the script is run it will generate the same commits - so to darken the words, run it again.
`bash graph-iti.sh` to run it.
##daily-commit-streak.sh
A bash script that is designed to be run daily with a 60% chance of making a commit for that day.
1. Update the `git_repo` variable with the path to your repo.
2. Update the `percent_chance_of_committing` variable with whatever percentage you like.
By default the script will commit 60% of the time.
3. Update the `max_number_of_commits` variable.
By default, each time the script runs and it passes the percentage check, it will commit between 1-3 times.
###To run this script daily
*Assuming you want to do this on an always-on linux server with a bash shell*
1. This script needs to be executable in order for cron to run it:
In the folder with the script, run `chmod +x daily-commit-streak.sh`
2. In the terminal, run `crontab -e`
3. Add the script to the bottom of the entries in the format `m h  dom mon dow   command`
For example `00 11 * * * /home/admin/commit-graph-iti/daily-commit-streak.sh`
To make sure the job was added, type `crontab -l` in your terminal.
4. Verify that the cron service is running with `systemctl status crond` or similar depending on your distro.
5. If cron is not active, `sudo systemctl start crond` or similar depending on your distro.
