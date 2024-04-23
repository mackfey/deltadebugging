# Bash scripting resources

If you elect to write the interestingness test script as a Bash script,
here are some resources you might find helpful.

## Handling Infinite Execution

The `timeout` program, which is a part of GNU coreutils, can force a program to
terminate after a specific amount of time.  The test script can call `timeout`
with appropriate arguments to determine if execution of a command timed out by
inspecting the overall exit status of `timeout`.

- [`timeout(1)`](https://man.archlinux.org/man/timeout.1)

## Deciding If Test Input Is "Interesting"

The `delta` program tells if an input file is "interesting" from the exit
status of the test script.  The documentation of `delta` under `delta/docs`
specifies what exit status the test script should generate under different
conditions.  Below are some articles about using exit status in Bash:

- <https://bencane.com/2014/09/02/understanding-exit-codes-and-how-to-use-them-in-bash-scripts/>
- <https://www.gnu.org/software/bash/manual/html_node/Exit-Status.html#Exit-Status>

## Passing in File Name to the Test Script

The `delta` program will pass in the path to the input file as the first
argument to the test script.  The test script, if written in Bash, can get the
file name via positional parameter `$1`.  Below are some articles about
positional parameters:

- <https://wiki.bash-hackers.org/scripting/posparams>
- <https://www.gnu.org/software/bash/manual/html_node/Positional-Parameters.html>
