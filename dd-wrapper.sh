#!/bin/sh

# This shell script invokes the Delta Debugging implementation
# to minimize file failing.txt .
# The minimized version is output to file min.txt .

# You need to replace "your_interestingness_test_script"
# by the filename of your interestingness test script.

./delta/bin/delta -test=dd-test.py -cp_minimal=./min.txt < failing.txt


