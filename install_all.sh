#!/bin/sh

. ./basic.sh


CommandExists terminator
if [ $? -ne 0 ];
then
	command="sudo apt-get install terminator"
	echo "\033[32m      using command: $command"
	$command
fi
