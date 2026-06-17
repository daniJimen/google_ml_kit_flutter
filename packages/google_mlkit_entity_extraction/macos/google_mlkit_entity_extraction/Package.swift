// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "google_mlkit_entity_extraction",
    platforms: [
        .macOS("10.15")
    ],
    products: [
        .library(name: "google-mlkit-entity-extraction", targets: ["google_mlkit_entity_extraction"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "google_mlkit_entity_extraction",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            path: "Sources/google_mlkit_entity_extraction"
        )
    ]
)