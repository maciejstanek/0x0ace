#!/bin/bash

ip=80.233.134.207
game_key="X-0x0ACE-Key: PKmAZq8oYagM1R6N2ZOlxzJbknvpVXJe9V3q0wyQAe5LKj8W4EPG9dDrm0jW6VNL"
binary_file=storage/$(date "+%Y%m%d%H%M%S").bin
html_file=.dump.html

# Scrap the current html page
curl --header "$game_key" $ip/0x00000ACE.html > $html_file
binary_file_url=$ip/$(cat $html_file | grep POST | sed 's/.*\(challenge[^\"]*\)\">/\1/')

# Scrap the current binary file
curl --header "$gamekey" $binary_file_url > $binary_file

# Process
./cpu $binary_file

