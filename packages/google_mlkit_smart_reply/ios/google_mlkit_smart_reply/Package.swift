// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "google_mlkit_smart_reply",
    platforms: [
        .iOS("15.5"),
        .macOS("10.15")
    ],
    products: [
        .library(name: "google-mlkit-smart-reply", targets: ["google_mlkit_smart_reply"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(name: "MlKitFrameworks", path: "../../../mlkit_frameworks")
    ],
    targets: [
        .target(
            name: "google_mlkit_smart_reply",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "MLKitSmartReply", package: "MlKitFrameworks")
            ],
            path: "Sources/google_mlkit_smart_reply"
        )
    ]
)
