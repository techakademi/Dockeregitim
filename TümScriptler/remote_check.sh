#!/bin/bash

##
# BASH script that checks the following:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections 
#   - Kernel version
##

##
# Memory check
##
server_name=$(hostname)

function memory_check() {
    echo "#######"
	echo "${server_name} Mevcut Memory   is: "
	free -h
	echo "#######"
    echo ""
}


function cpu_check() {
    echo "#######"
	echo "The current CPU load on ${server_name} is: "
    echo ""
	uptime
    echo "#######"
    echo ""
}

function tcp_check() {
    echo "#######"
	echo "Total TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo "#######"
    echo ""
}

function kernel_check() {
    echo "#######"
	echo "The exact Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo "#######"
    echo ""
}

function all_checks() {
	memory_check
	cpu_check
	tcp_check
	kernel_check
}

all_checks