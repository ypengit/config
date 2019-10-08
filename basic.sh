#!/bin/sh

CommandExists() {
	which "$1" > /dev/null
	if [ $? -eq 0 ];
	then
		echo "\033[32m ===> command $1 is exist \033[0m"
		return 0
	else
		echo "\033[31m ===> command $1 not exist \033[0m"
		return 1
	fi
}

