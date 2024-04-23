#!/usr/bin/env python3

import subprocess
import time
import signal
import os
import sys

def run_program_with_timeout(program, timeout):
    # Start the program as a subprocess
    process = subprocess.Popen(program, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    # Wait for the process to terminate or timeout
    start_time = time.time()
    while process.poll() is None and time.time() - start_time < timeout:
        time.sleep(0.1)

    # If process is still running after timeout, kill it
    if process.poll() is None:
        os.kill(process.pid, signal.SIGTERM)
        return None, None, "Process timed out after {} seconds and was terminated.".format(timeout)

    # Get the output
    stdout, stderr = process.communicate()
    return stdout, stderr, None


# Access arguments passed to the script
args = sys.argv

program = ["perl", "/Users/katherinemurphy/Desktop/BSMS/csep504/deltadebugging/mysort.pl", args[1]]
timeout = 1  # Timeout in seconds
stdout, stderr, error = run_program_with_timeout(program, timeout)
if error:
    exit(0)
else:
    exit(1)
