// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "google_mlkit_selfie_segmentation",
    platforms: [
        .iOS("15.5"),
        .macOS("10.15")
    ],
    products: [
        .library(name: "google-mlkit-selfie-segmentation", targets: ["google_mlkit_selfie_segmentation"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(name: "MlKitFrameworks", path: "../../../mlkit_frameworks"),
        .package(name: "google_mlkit_commons", path: "../../google_mlkit_commons/ios/google_mlkit_commons")
    ],
    targets: [
        .target(
            name: "google_mlkit_selfie_segmentation",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "MLKitSegmentationSelfie", package: "MlKitFrameworks"),
                .product(name: "MLKitVision", package: "MlKitFrameworks"),
                .product(name: "google-mlkit-commons", package: "google_mlkit_commons")
            ],
            path: "Sources/google_mlkit_selfie_segmentation"
        )
    ]
)
