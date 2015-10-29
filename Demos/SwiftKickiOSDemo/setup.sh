#!/bin/sh

echo "Starting..."
echo "Rebuilding Pods and workspace..."
pod install
sleep 1
open SwiftKickiOSDemo.xcworkspace
echo "Done."

