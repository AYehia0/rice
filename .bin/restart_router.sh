#!/usr/bin/expect

## USER CONFIG ###

set hostname "192.168.1.1"
set username "admin"
set password "admin"
set timeout 20

spawn telnet $hostname

expect "Password:"
send "$password\n";
expect ">"
send "sys reboot\n";
interact
