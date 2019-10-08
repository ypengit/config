#!/bin/sh
. ./basic.sh

echo "\033[32m **** start to install all environment **** \033[0m"

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
TERMINATOR_DIR=$HOME/.config/terminator

#install terminator config
CommandExists "terminator"
if [ $? -eq 0 ];
then
	if ! test -d $TERMINATOR_DIR;
	then
		mkdir -p $TERMINATOR_DIR  
	fi
	command="cp -rf $SCRIPT_DIR/terminator_config $TERMINATOR_DIR/config"
	echo "      using command: $command"
	$command
else
	echo "      exiting script"
	exit
fi

#install vim config
CommandExists "vim"
if [ $? -eq 0 ];
then
    echo "      using local?(yes/no):"
    read use_local

    if [ use_local -streq "yes" ];
    then
        command="sh $SCRIPT_DIR/vim_config.sh"
        echo "      using command: $command"
        $command
    elif [ use_local -streq "no" ];
    then
        cat $SCRIPT_DIR/vim.tar.gz.* | tar xvf -
        mv .vim $HOME/
    fi
else
	echo "      exiting script"
	exit
fi


echo "\033[32m **** finish to install all environment **** \033[0m"
