#!/bin/bash

# copy something from STDIN and echo it back.
# useful when copying a range from vim, so we don't "eat" what we copied
pbcopy; pbpaste

