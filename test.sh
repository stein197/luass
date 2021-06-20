#!/bin/bash
if ! command -v lua &> /dev/null
then
	echo "Lua is not installed"
	exit
fi
clear && lua test/class.lua --verbose && lua test/memory.lua $1
