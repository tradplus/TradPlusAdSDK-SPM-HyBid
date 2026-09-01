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
            .exact("15.14.0")
        ),
        .package(
            url: "https://github.com/vervegroup/hybid-ios-spm-sdk.git",
            .exact("3.8.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-HyBid/releases/download/15.14.0/TPVerveAdapter-15.14.0.xcframework.zip",
            checksum: "1e6bb14d18d51872a1b639e1f8e0ffcaa00d69742bb5caac01c7442ba930bb92"
        ),
    ]
)
