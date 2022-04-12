#!/bin/bash
set -eE
trap 'printf "\e[31m%s: %s\e[m\n" "ERROR" $?' ERR

ROOT="$(cd "${0%/*}" 2>/dev/null; echo "$PWD")"
BUILD="$ROOT/build.static"

#rm -rf "$BUILD"

#xcodebuild archive -workspace "$ROOT/FacebookSDK.xcworkspace" -scheme 'BuildAllKits-Static' -configuration Release -archivePath "$BUILD/iOS" -sdk iphoneos -destination 'generic/platform=iOS' SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
#xcodebuild archive -workspace "$ROOT/FacebookSDK.xcworkspace" -scheme 'BuildAllKits-Static' -configuration Release -archivePath "$BUILD/iOSSimulator" -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
#xcodebuild archive -workspace "$ROOT/FacebookSDK.xcworkspace" -scheme 'BuildAllKits-Static' -configuration Release -archivePath "$BUILD/MacCatalyst" -sdk iphoneos -destination 'generic/platform=macOS,variant=Mac Catalyst' SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
#xcodebuild archive -workspace "$ROOT/FacebookSDK.xcworkspace" -scheme 'BuildAllKits_TV-Static' -configuration Release -archivePath "$BUILD/tvOS" -sdk appletvos -destination 'generic/platform=tvOS' SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
#xcodebuild archive -workspace "$ROOT/FacebookSDK.xcworkspace" -scheme 'BuildAllKits_TV-Static' -configuration Release -archivePath "$BUILD/tvOSSimulator" -sdk appletvsimulator -destination 'generic/platform=tvOS Simulator' SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKCoreKit_Basics.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBSDKCoreKit_Basics.framework" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKCoreKit_Basics.framework" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBSDKCoreKit_Basics.framework" \
    -framework "$BUILD/tvOS.xcarchive/Products/Library/Frameworks/FBSDKCoreKit_Basics.framework" \
    -framework "$BUILD/tvOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKCoreKit_Basics.framework"

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKCoreKit.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBSDKCoreKit.framework" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKCoreKit.framework" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBSDKCoreKit.framework" \
    -framework "$BUILD/tvOS.xcarchive/Products/Library/Frameworks/FBSDKCoreKit.framework" \
    -framework "$BUILD/tvOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKCoreKit.framework"

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKLoginKit.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBSDKLoginKit.framework" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKLoginKit.framework" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBSDKLoginKit.framework" \
    -framework "$BUILD/tvOS.xcarchive/Products/Library/Frameworks/FBSDKLoginKit.framework" \
    -framework "$BUILD/tvOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKLoginKit.framework"

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKShareKit.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBSDKShareKit.framework" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKShareKit.framework" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBSDKShareKit.framework" \
    -framework "$BUILD/tvOS.xcarchive/Products/Library/Frameworks/FBSDKShareKit.framework" \
    -framework "$BUILD/tvOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKShareKit.framework"

xcodebuild -create-xcframework \
    -output "$BUILD/FBAEMKit.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBAEMKit.framework" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBAEMKit.framework" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBAEMKit.framework"

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKGamingServicesKit.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBSDKGamingServicesKit.framework" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKGamingServicesKit.framework" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBSDKGamingServicesKit.framework"

xcodebuild -create-xcframework \
    -output "$BUILD/FacebookGamingServices.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FacebookGamingServices.framework" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FacebookGamingServices.framework" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FacebookGamingServices.framework"

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKTVOSKit.xcframework" \
    -framework "$BUILD/tvOS.xcarchive/Products/Library/Frameworks/FBSDKTVOSKit.framework" \
    -framework "$BUILD/tvOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKTVOSKit.framework"
