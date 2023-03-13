#!/bin/bash

# Get all the members in the same group
getent group cades-ccsi

# Print all machine related info
uname -a

# Print user info
id sshu3

# find any files before certain time and remove
find ./*.log.* ! -newermt "2023-03-01 00:00:00" | xargs rm -rf
