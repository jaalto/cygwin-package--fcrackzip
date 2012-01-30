#!/bin/sh
# Copyright (C) 2007 Jari Aalto; Licenced under GPL v2 or later
#
# install-after.sh -- Custom installation
#
# The script will receive one argument: relative path to
# installation root directory. Script is called like:
#
#    $ install-after.sh .inst
#
# This script is run after [install] command.

Cmd()
{
    echo "$@"
    [ "$test" ] && return
    "$@"
}

Main()
{
    root=${1:-".inst"}

    if [ "$root"  ] && [ -d $root ]; then

        root=$(echo $root | sed 's,/$,,')  # Delete trailing slash

        Cmd mv $root/usr/bin/zipinfo $root/usr/bin/fcrackzipinfo

    fi
}

Main "$@"

# End of file
