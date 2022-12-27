// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClockLibr", platforms: [
        .iOS(.v15)],
    products: [

        .library(
            name: "ClockLibr",
            targets: ["ClockLibr"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ClockLibr",
            dependencies: ["ClockLibr"]),
        .testTarget(
            name: "ClockLibrTests",
            dependencies: ["ClockLibr"]),
    ]
  
)
