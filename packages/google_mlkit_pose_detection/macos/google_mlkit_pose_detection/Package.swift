// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "google_mlkit_pose_detection",
    platforms: [
        .macOS("10.15")
    ],
    products: [
        .library(name: "google-mlkit-pose-detection", targets: ["google_mlkit_pose_detection"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "google_mlkit_pose_detection",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            path: "Sources/google_mlkit_pose_detection"
        )
    ]
)