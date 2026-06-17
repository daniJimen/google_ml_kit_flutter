// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "google_mlkit_text_recognition",
    platforms: [
        .macOS("10.15")
    ],
    products: [
        .library(name: "google-mlkit-text-recognition", targets: ["google_mlkit_text_recognition"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "google_mlkit_text_recognition",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            path: "Sources/google_mlkit_text_recognition"
        )
    ]
)