// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyXrayCore",
    platforms: [
        .iOS(.v15),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftyXrayCore",
            targets: ["SwiftyXrayCore"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
          name: "SwiftyXrayCore",
          url: "https://github.com/dima-u/SwiftyXrayCore/releases/download/1.1.0/SwiftyXrayCore.xcframework.zip",
          checksum: "8cd20a604af0854c2ba18ad64135b33fd5843729b250813a497965dbef2f1275"
        )
    ]
)
