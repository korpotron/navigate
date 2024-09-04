// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Present",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Present",
            targets: [
                "Present"
            ]
        ),
    ],
    targets: [
        .target(
            name: "Present"),
        .testTarget(
            name: "PresentTests",
            dependencies: [
                "Present"
            ]
        ),
    ]
)
