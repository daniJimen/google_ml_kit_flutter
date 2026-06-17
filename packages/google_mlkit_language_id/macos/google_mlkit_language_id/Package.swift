// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "google_mlkit_language_id",
    platforms: [
        .macOS("10.15")
    ],
    products: [
        .library(name: "google-mlkit-language-id", targets: ["google_mlkit_language_id"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "google_mlkit_language_id",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            path: "Sources/google_mlkit_language_id"
        )
    ]
)