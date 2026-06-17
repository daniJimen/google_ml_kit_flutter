import FlutterMacOS

@objc
public class GoogleMlkitSelfieSegmentationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_selfie_segmenter",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitSelfieSegmentationPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}