#!/usr/bin/env python

import sys
import time
import subprocess

t = 1
success = False
command = sys.argv[1:]
commandStr = ' '.join(command)

while True:
    result = subprocess.call(command)
    success = result == 0
    if success:
        break
    sys.stderr.write(
        "`{0}` failed! waiting {1} seconds...\n".format(commandStr, t)
    )
    time.sleep(t)
    t = t * 2
