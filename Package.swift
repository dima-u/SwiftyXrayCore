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
          url: "https://github.com/dima-u/SwiftyXrayCore/releases/download/1.0/SwiftyXrayCore.xcframework.zip",
          checksum: "467bb4ec7392f525879a92281f14cbf0b23898dc5afa25b6b1182c45ad4634d5"
        )
    ]
)
