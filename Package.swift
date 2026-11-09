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
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/vervegroup/hybid-ios-spm-sdk.git",
            .exact("3.9.3")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-HyBid/releases/download/15.18.0/TPVerveAdapter-15.18.0.xcframework.zip",
            checksum: "bcf321aee15ec72eb6198edd520ed6e02c1f5ded0e259c7afb5076a13228438f"
        ),
    ]
)
