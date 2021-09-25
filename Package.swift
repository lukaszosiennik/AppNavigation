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
    dependencies: [
        .package(
            url: "git@bitbucket.org:openplainness/commons.git",
            .branch("develop")
        ),
    ],
    targets: [
        .target(
            name: "AppNavigation",
            dependencies: [
                .byName(
                    name: "commons"
                ),
            ]
        ),
    ]
)
