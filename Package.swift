// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "netfox",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "netfox",
            targets: ["netfox"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.5.0"),
    ],
    targets: [
        .target(
            name: "netfox",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm"),
            ],
            path: "netfox/",
            exclude: ["OSX"],
            resources: [
                .process("Media.xcassets")
            ]
        )
    ]
)
