// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusHyBidAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusHyBidAdapter",
            targets: ["TradPlusHyBidAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.17.0")
        ),
        .package(
            url: "https://github.com/vervegroup/hybid-ios-spm-sdk.git",
            .exact("3.9.2")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusHyBidAdapter",
            dependencies: [
                .target(name: "TPVerveAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "HyBid", package: "hybid-ios-spm-sdk"),
            ],
            path: ".",
            sources: ["Sources/TradPlusHyBidAdapter/TradPlusHyBidAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPVerveAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-HyBid/releases/download/15.17.0/TPVerveAdapter-15.17.0.xcframework.zip",
            checksum: "b9ebb497f0a83c5e34cfd06fa5e8cd1e5f416eb2419cff12e0bbab953d7307a9"
        ),
    ]
)
