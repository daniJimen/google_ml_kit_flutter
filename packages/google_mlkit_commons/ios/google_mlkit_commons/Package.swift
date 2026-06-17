// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "google_mlkit_commons",
    platforms: [
        .iOS("15.5"),
        .macOS("10.15")
    ],
    products: [
        .library(name: "google-mlkit-commons", targets: ["google_mlkit_commons"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(name: "MlKitFrameworks", path: "../../../mlkit_frameworks")
    ],
    targets: [
        .target(
            name: "google_mlkit_commons",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "MLKitCommon", package: "MlKitFrameworks"),
                .product(name: "MLKitVision", package: "MlKitFrameworks")
            ],
            path: "Sources/google_mlkit_commons"
        )
    ]
)