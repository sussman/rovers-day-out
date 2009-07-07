#!/bin/sh

# This script assumes you're sitting in your 'rover' working copy, and
# that 'rover.inform' is at the top of the working copy.

echo "Copying from rover.inform/ ..."
cp rover.inform/Source/story.ni story.ni
echo "Doing commit..."
hg commit
echo "Done.  Run 'hg push' to publish to the server, if you wish."
