// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "google_mlkit_genai_rewriting",
    platforms: [
        .macOS("10.15")
    ],
    products: [
        .library(name: "google-mlkit-genai-rewriting", targets: ["google_mlkit_genai_rewriting"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "google_mlkit_genai_rewriting",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            path: "Sources/google_mlkit_genai_rewriting"
        )
    ]
)