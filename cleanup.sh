#!/bin/sh

echo "Cleaning up..."
sleep 1

# Clean up the custom attributes
find ./ -name '*.DS_Store' -print -type f -delete

# Clean up the extended attributes
xattr -vcr ./SwiftKickTests cleanup.sh *.xcodeproj *md

# Nuke the project data
rm -rf ./DerivedData

echo "Done."
