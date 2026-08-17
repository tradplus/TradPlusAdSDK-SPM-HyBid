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
            .exact("15.13.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-HyBid/releases/download/15.13.0/TPVerveAdapter-15.13.0.xcframework.zip",
            checksum: "972dfa440cca0e9c6ae1313228c38063d27da972ad29f16395243396805972e7"
        ),
    ]
)
