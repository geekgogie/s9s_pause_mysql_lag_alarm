# s9s_pause_mysql_lag_alarm
Pause the MySQL replica lag alarm. This is useful if you have large data set and is performing a backup. Use this if you want to pause lag for # of hours.
Simply change the variables:
### CID - the cluster id
### HOURS_ACCEPTABLE_LAG - the acceptable hours 
### PAUSE_LOG_FILE - the path to the log file
