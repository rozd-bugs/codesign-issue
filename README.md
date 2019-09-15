# codesign-issue

This project could be used to reproduce an issue with signing Swift fram

This project reproduces [AIR-4198873](https://tracker.adobe.com/#/view/AIR-4198873) issue when AIR SDK incorrectly signs Swift frameworks that contain `.xcdatamodel` files.

Installation of the `.ipa` file built from this project failed with error like this:
```
default	18:36:15.762552 +0300	installd	0x16fe23000 +[MICodeSigningVerifier _validateSignatureAndCopyInfoForURL:withOptions:error:]: 199: Failed to verify code signature of /private/var/installd/Library/Caches/com.apple.mobile.installd.staging/temp.DBB2WZ/extracted/Payload/CodeSignIssueDebug.app/Frameworks/CodeSignIssueExtension.framework : 0xe8008001 (An unknown error has occurred.)
```

Verification of code sign of the `.framework` looks like this:
```
$ codesign -dv --verbose=4 codesign-issue-air/codesign-issue-debug/bin/Payload/CodeSignIssueDebug.app/Frameworks/CodeSignIssueExtension.framework/
Executable=/Users/max/lab/bugs/codesign-issue/codesign-issue-air/codesign-issue-debug/bin/Payload/CodeSignIssueDebug.app/Frameworks/CodeSignIssueExtension.framework/CodeSignIssueExtension

Identifier=com.github.rozd-bugs.CodeSignIssueExtension
Format=bundle with Mach-O universal (armv7 arm64)
CodeDirectory v=20200 size=667 flags=0x0(none) hashes=23+5 location=embedded
VersionPlatform=2
VersionMin=524288
VersionSDK=851968
Hash type=sha1 size=20
CandidateCDHash sha1=31a0241d2dfa7aeb0ca66c0eeceda574bc41ff9a
Hash choices=sha1
Page size=4096
CDHash=31a0241d2dfa7aeb0ca66c0eeceda574bc41ff9a
Signature size=4334
Authority=iPhone Developer: Maksym Rozdobudko (Y577HTUTT3)
Authority=Apple Worldwide Developer Relations Certification Authority
Authority=Apple Root CA
Signed Time=Sep 15, 2019 at 6:36:03 PM
Info.plist=not bound
TeamIdentifier=GL9F4DL9W9
Sealed Resources version=2 rules=12 files=2
Internal requirements count=0 size=12
Maksyms-MacBook-Pro:codesign-issue max$ 
```
