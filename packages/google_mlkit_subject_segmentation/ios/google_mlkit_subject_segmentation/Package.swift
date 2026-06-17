// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "google_mlkit_subject_segmentation",
    platforms: [
        .iOS("15.5"),
        .macOS("10.15")
    ],
    products: [
        .library(name: "google-mlkit-subject-segmentation", targets: ["google_mlkit_subject_segmentation"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(name: "google_mlkit_commons", path: "../../google_mlkit_commons/ios/google_mlkit_commons")
    ],
    targets: [
        .target(
            name: "google_mlkit_subject_segmentation",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "google-mlkit-commons", package: "google_mlkit_commons")
            ],
            path: "Sources/google_mlkit_subject_segmentation"
        )
    ]
)
