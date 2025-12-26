#!/bin/zsh

#brew install node@v.22

# xray-core
git clone https://github.com/XTLS/Xray-core.git
cd Xray-core
git checkout v25.10.15
cd ..

#lib xray
git clone https://github.com/XTLS/libXray.git
cd libxray/
git checkout v25.10.15
# run build script to fetch go deps, gobind etc.
python3 build/main.py apple gomobile
cd ..

#outline app
git clone https://github.com/Jigsaw-Code/outline-apps.git
cd outline-apps/
git checkout client_ios/v1.15.2

# build outline using their script to setup environment and deps
npm install chalk
#this may fail in due to node incompatible version in it
#but we need this only to prepare go
npm run action client/src/cordova/build ios || true

# copy xray wrappers there
mkdir client/go/libXray
cp ../libXray/xray_wrapper.go client/go/libXray/
cp ../libXray/nodep_wrapper.go client/go/libXray/
# important, apply specific patches:
# - we need shared outline tun2socks + xray xcframework
git apply ../outline-xray-mixin.patch

go mod tidy

export cur_pwd=$(pwd)
# build our mixed library
$cur_pwd/client/output/build/bin/gomobile bind -ldflags='-s -w' \
 -target=ios,iossimulator,macos,maccatalyst -iosversion=15.5 -bundleid org.swiftyxray.core \
 -o "$cur_pwd/client/output/build/apple/SwiftyXrayCore.xcframework" \
 "$cur_pwd/client/go/outline/platerrors" "$cur_pwd/client/go/outline/tun2socks" "$cur_pwd/client/go/outline" "$cur_pwd/client/go/libXray"

# if everything is fine -> we have working framework
open client/output/build/apple
