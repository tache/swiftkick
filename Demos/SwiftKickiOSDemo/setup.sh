#!/bin/sh
export COCOAPODS_DISABLE_DETERMINISTIC_UUIDS=YES

echo "Setting up your development environment and starting xcode..."

# note: this will upgrade to the latest, maybe need to stay at a fixed bundler version?
if ! gem list -i bundler > /dev/null 2>&1; then
echo "Installing Bundler"
gem install bundler
fi

# note: This installs whatever is defined inthe Gemfile and Gemfile.lock
# ensuring that our env is the same versions as desired for all of our environments
echo "Rebuilding Pods and workspace..."
bundle install

# note: installs the pods and creates the xcode workspace
echo "Rebuilding Pods and workspace..."
pod repo update 
pod install

echo "Open Workspace..."
sleep 1
open SwiftKickiOSDemo.xcworkspace

echo "Done."

