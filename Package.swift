// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MetaSerialization",
    products: [
        .library(name: "MetaSerialization", targets: ["MetaSerialization"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "2.2.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.5"),
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.1.0"),
    ],
    targets: [
        .target(
            name: "MetaSerialization",
            dependencies: [
                .product(name: "OrderedCollections", package: "swift-collections"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "MetaSerializationTests",
            dependencies: [
                .byName(name: "Quick"),
                .byName(name: "Nimble"),
                .target(name: "MetaSerialization"),
            ], 
            path: "Tests"
        ),
    ]
)
