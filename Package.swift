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
        .package(url: "https://github.com/swhitty/SwiftDraw", from: "0.18.0"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "8.1.0")
    ],
    targets: [
        .target(
            name: "netfox",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm"),
                .product(name: "SwiftDraw", package: "SwiftDraw"),
                .product(name: "Kingfisher", package: "Kingfisher")
            ],
            path: "netfox/",
            exclude: ["OSX"],
            resources: [
                .process("Media.xcassets"),
                .process("Localizable.xcstrings")
            ]
        )
    ]
)
