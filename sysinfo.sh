#!/bin/bash

#Help option
if [ "$1" = "-h" ] || [ "$1" = "--halp" ]; then
    echo "This script shows system information"
    echo "1 - System Info"
    echo "2 - Disk Usage"
    echo "3 - Current Users"
    echo "4 - Top Processes"
    echo "5 - Exit"
    exit 0
fi

print_header() {
    echo "$1" 
    echo "Timestamp: $(date)"

}

# Title
echo "   Simple System Menu Script   "

while true
do

# Menu
echo "Welcome, select one of the following options using the number keys:"
echo "1: Show System Info"
echo "2: Show Disk Usage"
echo "3: Show Current Users"
echo "4: Show Top Processes"
echo "5: Exit"

read choice

if [ "$choice" = "1" ]; then
    print_header "System Info"
    uname -o 
    hostname
    uname -v
    uptime
elif [ "$choice" = "2" ]; then
    print_header "Disk Usage"
    df -h
elif [ "$choice" = "3" ]; then
    print_header "Current Users"
    who
    w
elif [ "$choice" = "4" ]; then
    print_header "TOP 5 CPU PROCESSES"

    echo "PID   USER    CPU%   COMMAND"
    

    ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 6 | tail -n 5 | while read pid user cpu command
    do
        echo "$pid   $user   $cpu%   $command"
    done
    
elif [ "$choice" = "5" ]; then
    exit 0

else
    echo "Invalid option. Please try again."
fi

done