#!/bin/sh

# This script assumes you're sitting in your 'rover' working copy, and
# that 'rover.inform' is at the top of the working copy.

# Make sure Inform is *not* running when you run this script!

echo "Pulling..."
hg pull
echo "Updating..."
hg update
echo "Copying into rover.inform/ ..."
cp story.ni rover.inform/Source/story.ni
echo "Done."

