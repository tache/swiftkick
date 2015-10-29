#!/bin/sh

echo "Cleaning up..."
sleep 1
/bin/rm -Rf docs
/bin/rm -Rf Pods
/bin/rm -Rf Podfile.lock
/bin/rm -Rf SwiftKickiOSDemo.xcworkspace

# Clean up the custom attributes
find ./ -name '*.DS_Store' -print -type f -delete

# Clean up the extended attributes
xattr -vcr ./SwiftKickiOSDemo ./SwiftKickiOSDemoTests Gemfile* setup.sh cleanup.sh *.xcodeproj Podfile*

echo "Done."
