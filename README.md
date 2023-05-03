# iCloudTest

An application to test uploading/downloading documents to iCloud Drive.

## Goals
1. Store a file on iCloud.
2. The file should be accessible to the user in the Finder app.

## Resources
https://developer.apple.com/documentation/xcode/configuring-icloud-services
https://www.answertopia.com/ios/preparing-an-ios-app-to-use-icloud-storage/
https://www.answertopia.com/ios/using-icloud-drive-storage-in-an-ios-app/
https://stackoverflow.com/questions/65173861/saving-a-file-to-icloud-drive

## Status
It doesn't work. 
The file saves without error but doesn't exist when loading. It also doesn't show in Finder. 

Output when user saves:
```
Container path exists. Directory? true
Saving document to iCloud at file:///private/var/mobile/Library/Mobile%20Documents/iCloud~com~sillypog~iCloudTest/Documents/Gumgrumle.txt
```
Output when user then loads:
```
Attempting to load data from /private/var/mobile/Library/Mobile Documents/iCloud~com~sillypog~iCloudTest/Documents/Gumgrumle.txt
Document doesn't exist
```
