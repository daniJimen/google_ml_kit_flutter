import FlutterMacOS

@objc
public class GoogleMlkitEntityExtractionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_entity_extractor",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitEntityExtractionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}