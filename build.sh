#!/bin/bash

SCRIPT=testapp.rb
APPNAME=TestApp
CONTENTS="$APPNAME.app/Contents"
BIN="$CONTENTS/MacOS"

mkdir -p "$BIN"
cp "$SCRIPT" "$BIN/$APPNAME"
chmod +x "$BIN/$APPNAME"

cat > $CONTENTS/Info.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>$APPNAME</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleVersion</key>
	<string>1.0.2</string>
</dict>
</plist>
EOF
