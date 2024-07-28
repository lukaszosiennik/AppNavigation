// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "AppNavigation",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "AppNavigation",
            targets: [
                "AppNavigation",
            ]
        ),
    ],
    targets: [
        .target(
            name: "AppNavigation"
        ),
    ]
)
