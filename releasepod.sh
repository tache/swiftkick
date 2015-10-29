#!/bin/sh
echo "Releasing new version of the swiftkick cocoapod..."
echo "LINTING FIRST - IT'S A GOOD PRACTICE"
pod lib lint
sleep 1
echo "PUSHING THE POD"
pod trunk push SwiftKick.podspec
echo "Done."
