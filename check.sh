#!/bin/sh

. ./basic.sh

CommandExists terminator
if [ $? -ne 0 ];
then
	echo "    run command:\t\\033[32m sudo apt-get install terminator \033[0m"
	echo "     or command:\t\\033[32m sh install_all.sh \033[0m"
fi
