#!/bin/bash
git filter-branch --force --index-filter \
    "git rm -r --cached --ignore-unmatch $1" \
    --prune-empty --tag-name-filter cat -- --all
