import FlutterMacOS

@objc
public class GoogleMlkitSmartReplyPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_smart_reply",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitSmartReplyPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}