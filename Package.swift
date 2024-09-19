// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Navigate",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "Navigate",
            targets: [
                "Navigate"
            ]
        ),
        .library(
            name: "Example",
            targets: [
                "Example"
            ]
        ),
    ],
    targets: [
        .target(
            name: "Navigate"
        ),
        .testTarget(
            name: "NavigateTests",
            dependencies: [
                "Navigate"
            ]
        ),
        .target(
            name: "Example",
            dependencies: [
                "Navigate"
            ]
        ),
    ]
)
