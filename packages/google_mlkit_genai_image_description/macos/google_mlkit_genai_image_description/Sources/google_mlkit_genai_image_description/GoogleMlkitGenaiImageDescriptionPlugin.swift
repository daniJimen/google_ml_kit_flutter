import FlutterMacOS

@objc
public class GoogleMlkitGenaiImageDescriptionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_genai_image_description",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitGenaiImageDescriptionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}