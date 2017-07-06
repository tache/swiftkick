# SwiftKick Developers
Here are some rules and notes about developing for SwiftKick

## Releasing an Update
1) TEST your updates!
2) Bump the s.version of the pod in both the .podspec and the -Local.podspec files the the github tag.  The Local podspec should have a -development postfix to distinguish it from the release version.  Also bump the version in the xcode project. 
3) Commit all changes
4) Tag the release in github with the version (e.g. 0.1.6 or 1.2.1) 
5) Check the pod with 'pod lib lint SwiftKick.podspec'
6) Publish to cocoapods with './releasepod.sh'
