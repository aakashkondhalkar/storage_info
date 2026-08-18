// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "storage_info",
    platforms: [
        .iOS("12.0"),
    ],
    products: [
        .library(name: "storage-info", targets: ["storage_info"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "storage_info",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            resources: [
                .process("Resources"),
            ]
        )
    ]
)
