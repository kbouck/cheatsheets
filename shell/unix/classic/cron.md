# cheatsheet

```bash
crontab -e   # edit
crontab -l   # list

# format
* * * * *  command to execute (use absolute path, no $PATH env during execution)
│ │ │ │ │
│ │ │ │ └ day of week (0-6) (0=Sunday, 6=Saturday, 7=Sunday, Sunday=Sunday)
│ │ │ └ month (1-12)
│ │ └ day of month (1-31)
│ └ hour (0-23)
└ min (0-59)

# examples
* * * * *          # every minute
*/10 * * * *       # every 10 minutes

0 * * * *          # every hour
@hourly            # every hour
0 */4 * * *        # every 4 hours

0 0 * * *          # every day
@daily             # every day
0 1 * * *          # every day at 0100
0 5,17 * * *       # every day at 0500 and 1700
0 1 * * 1-5        # every weekday at 0100

0 0 1 * mon        # every week on monday at 0100
@weekly            # every week on monday at 0100
0 17 * * sun       # every week on sunday at 1700
0 17 * * sun,fri   # every week on friday and sunday at 1700

0 0 1 * *          # every month
@monthly           # every month

@reboot            # after reboot

# add from file
echo "* * * * * some_command" > $file
crontab $file

# stdout / stderr
# log stdout and stderr to file
*/10 * * * * /bin/execute/this/script.sh >> /var/log/script_output.log 2>&1

# suppress stdout (and thus emails)
*/10 * * * * /bin/execute/this/script.sh > /dev/null 2>&1

# execute cron command manually
# TODO




0 9,16 * * 1-5   # When the stock market closes and opens
0 0 25 12 * *    # At midnight on christmas
0 * 19 6 * *     # On Juneteenth every hour
0 9-17 * * 1-5   # During business hours


```



# troubleshooting

```bash
# "Operation not permitted" on macOS
- need to grant "full disk access" to cron
- System Preferences -> Security and Privacy -> Privacy Tab 
- Select "Full Disk Access" in left nav
- Add "/usr/sbin/cron" with checkbox enabled
```



# references

- https://tecadmin.net/crontab-in-linux-with-20-examples-of-cron-schedule/
- https://cronprompt.com
