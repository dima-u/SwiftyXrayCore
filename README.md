# SwiftyXrayCore

This project provides a Swift wrapper around the Xray core library to enable advanced networking capabilities on iOS and macOS platforms. It includes support for SOCKS5 proxying and integrates seamlessly with Apple's PacketTunnelProvider API.

## Overview

See `build.sh` to build xcframwework from sources.
Inder the hood build script uses:
- outline app (https://github.com/Jigsaw-Code/outline-apps) as base for building Xray Core binary and tunnel provider module
- patch that enables socks5 in outline sdk
- libxray and xray-core mixin with single library

SwiftyXrayCore is released under the Apache 2.0 License. See the LICENSE file for details.
