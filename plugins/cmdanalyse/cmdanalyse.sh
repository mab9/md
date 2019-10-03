
historyFile=~/.bash_history
cat $historyFile | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' | sort | uniq -c | sort -nr | head -n 15

