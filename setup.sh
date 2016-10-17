#!/bin/sh

export COCOAPODS_DISABLE_DETERMINISTIC_UUIDS=YES

echo "Starting..."

echo "Rebuilding Pods and workspace..."
bundle install

echo "Open Project..."
sleep 1
open SwiftKick.xcodeproj

echo "Done."

