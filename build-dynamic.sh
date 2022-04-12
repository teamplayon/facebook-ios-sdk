#!/bin/bash
set -eE
trap 'printf "\e[31m%s: %s\e[m\n" "ERROR($?): $BASH_SOURCE:$LINENO $BASH_COMMAND"' ERR

ROOT="$(cd "${0%/*}" 2>/dev/null; echo "$PWD")"
BUILD="$ROOT/build.dynamic"

rm -rf "$BUILD"

xcodebuild archive -workspace "$ROOT/FacebookSDK.xcworkspace" -scheme 'BuildAllKits-Dynamic' -configuration Release -archivePath "$BUILD/iOS" -sdk iphoneos -destination 'generic/platform=iOS' SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -workspace "$ROOT/FacebookSDK.xcworkspace" -scheme 'BuildAllKits-Dynamic' -configuration Release -archivePath "$BUILD/iOSSimulator" -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -workspace "$ROOT/FacebookSDK.xcworkspace" -scheme 'BuildAllKits-Dynamic' -configuration Release -archivePath "$BUILD/MacCatalyst" -sdk iphoneos -destination 'generic/platform=macOS,variant=Mac Catalyst' SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -workspace "$ROOT/FacebookSDK.xcworkspace" -scheme 'BuildAllKits_TV-Dynamic' -configuration Release -archivePath "$BUILD/tvOS" -sdk appletvos -destination 'generic/platform=tvOS' SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -workspace "$ROOT/FacebookSDK.xcworkspace" -scheme 'BuildAllKits_TV-Dynamic' -configuration Release -archivePath "$BUILD/tvOSSimulator" -sdk appletvsimulator -destination 'generic/platform=tvOS Simulator' SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKCoreKit_Basics.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBSDKCoreKit_Basics.framework" \
    -debug-symbols "$BUILD/iOS.xcarchive/dSYMs/FBSDKCoreKit_Basics.framework.dSYM" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKCoreKit_Basics.framework" \
    -debug-symbols "$BUILD/iOSSimulator.xcarchive/dSYMs/FBSDKCoreKit_Basics.framework.dSYM" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBSDKCoreKit_Basics.framework" \
    -debug-symbols "$BUILD/MacCatalyst.xcarchive/dSYMs/FBSDKCoreKit_Basics.framework.dSYM" \
    -framework "$BUILD/tvOS.xcarchive/Products/Library/Frameworks/FBSDKCoreKit_Basics.framework" \
    -debug-symbols "$BUILD/tvOS.xcarchive/dSYMs/FBSDKCoreKit_Basics.framework.dSYM" \
    -framework "$BUILD/tvOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKCoreKit_Basics.framework" \
    -debug-symbols "$BUILD/tvOSSimulator.xcarchive/dSYMs/FBSDKCoreKit_Basics.framework.dSYM"

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKCoreKit.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBSDKCoreKit.framework" \
    -debug-symbols "$BUILD/iOS.xcarchive/dSYMs/FBSDKCoreKit.framework.dSYM" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKCoreKit.framework" \
    -debug-symbols "$BUILD/iOSSimulator.xcarchive/dSYMs/FBSDKCoreKit.framework.dSYM" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBSDKCoreKit.framework" \
    -debug-symbols "$BUILD/MacCatalyst.xcarchive/dSYMs/FBSDKCoreKit.framework.dSYM" \
    -framework "$BUILD/tvOS.xcarchive/Products/Library/Frameworks/FBSDKCoreKit.framework" \
    -debug-symbols "$BUILD/tvOS.xcarchive/dSYMs/FBSDKCoreKit.framework.dSYM" \
    -framework "$BUILD/tvOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKCoreKit.framework" \
    -debug-symbols "$BUILD/tvOSSimulator.xcarchive/dSYMs/FBSDKCoreKit.framework.dSYM"

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKLoginKit.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBSDKLoginKit.framework" \
    -debug-symbols "$BUILD/iOS.xcarchive/dSYMs/FBSDKLoginKit.framework.dSYM" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKLoginKit.framework" \
    -debug-symbols "$BUILD/iOSSimulator.xcarchive/dSYMs/FBSDKLoginKit.framework.dSYM" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBSDKLoginKit.framework" \
    -debug-symbols "$BUILD/MacCatalyst.xcarchive/dSYMs/FBSDKLoginKit.framework.dSYM" \
    -framework "$BUILD/tvOS.xcarchive/Products/Library/Frameworks/FBSDKLoginKit.framework" \
    -debug-symbols "$BUILD/tvOS.xcarchive/dSYMs/FBSDKLoginKit.framework.dSYM" \
    -framework "$BUILD/tvOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKLoginKit.framework" \
    -debug-symbols "$BUILD/tvOSSimulator.xcarchive/dSYMs/FBSDKLoginKit.framework.dSYM"

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKShareKit.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBSDKShareKit.framework" \
    -debug-symbols "$BUILD/iOS.xcarchive/dSYMs/FBSDKShareKit.framework.dSYM" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKShareKit.framework" \
    -debug-symbols "$BUILD/iOSSimulator.xcarchive/dSYMs/FBSDKShareKit.framework.dSYM" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBSDKShareKit.framework" \
    -debug-symbols "$BUILD/MacCatalyst.xcarchive/dSYMs/FBSDKShareKit.framework.dSYM" \
    -framework "$BUILD/tvOS.xcarchive/Products/Library/Frameworks/FBSDKShareKit.framework" \
    -debug-symbols "$BUILD/tvOS.xcarchive/dSYMs/FBSDKShareKit.framework.dSYM" \
    -framework "$BUILD/tvOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKShareKit.framework" \
    -debug-symbols "$BUILD/tvOSSimulator.xcarchive/dSYMs/FBSDKShareKit.framework.dSYM"

xcodebuild -create-xcframework \
    -output "$BUILD/FBAEMKit.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBAEMKit.framework" \
    -debug-symbols "$BUILD/iOS.xcarchive/dSYMs/FBAEMKit.framework.dSYM" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBAEMKit.framework" \
    -debug-symbols "$BUILD/iOSSimulator.xcarchive/dSYMs/FBAEMKit.framework.dSYM" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBAEMKit.framework" \
    -debug-symbols "$BUILD/MacCatalyst.xcarchive/dSYMs/FBAEMKit.framework.dSYM"

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKGamingServicesKit.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FBSDKGamingServicesKit.framework" \
    -debug-symbols "$BUILD/iOS.xcarchive/dSYMs/FBSDKGamingServicesKit.framework.dSYM" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKGamingServicesKit.framework" \
    -debug-symbols "$BUILD/iOSSimulator.xcarchive/dSYMs/FBSDKGamingServicesKit.framework.dSYM" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FBSDKGamingServicesKit.framework" \
    -debug-symbols "$BUILD/MacCatalyst.xcarchive/dSYMs/FBSDKGamingServicesKit.framework.dSYM"

xcodebuild -create-xcframework \
    -output "$BUILD/FacebookGamingServices.xcframework" \
    -framework "$BUILD/iOS.xcarchive/Products/Library/Frameworks/FacebookGamingServices.framework" \
    -debug-symbols "$BUILD/iOS.xcarchive/dSYMs/FacebookGamingServices.framework.dSYM" \
    -framework "$BUILD/iOSSimulator.xcarchive/Products/Library/Frameworks/FacebookGamingServices.framework" \
    -debug-symbols "$BUILD/iOSSimulator.xcarchive/dSYMs/FacebookGamingServices.framework.dSYM" \
    -framework "$BUILD/MacCatalyst.xcarchive/Products/Library/Frameworks/FacebookGamingServices.framework" \
    -debug-symbols "$BUILD/MacCatalyst.xcarchive/dSYMs/FacebookGamingServices.framework.dSYM"

xcodebuild -create-xcframework \
    -output "$BUILD/FBSDKTVOSKit.xcframework" \
    -framework "$BUILD/tvOS.xcarchive/Products/Library/Frameworks/FBSDKTVOSKit.framework" \
    -debug-symbols "$BUILD/tvOS.xcarchive/dSYMs/FBSDKTVOSKit.framework.dSYM" \
    -framework "$BUILD/tvOSSimulator.xcarchive/Products/Library/Frameworks/FBSDKTVOSKit.framework" \
    -debug-symbols "$BUILD/tvOSSimulator.xcarchive/dSYMs/FBSDKTVOSKit.framework.dSYM"
