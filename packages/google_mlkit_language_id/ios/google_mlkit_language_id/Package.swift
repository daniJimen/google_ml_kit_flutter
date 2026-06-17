// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "google_mlkit_language_id",
    platforms: [
        .iOS("15.5"),
        .macOS("10.15")
    ],
    products: [
        .library(name: "google-mlkit-language-id", targets: ["google_mlkit_language_id"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(name: "MlKitFrameworks", path: "../../../mlkit_frameworks")
    ],
    targets: [
        .target(
            name: "google_mlkit_language_id",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "MLKitLanguageID", package: "MlKitFrameworks")
            ],
            path: "Sources/google_mlkit_language_id"
        )
    ]
)
