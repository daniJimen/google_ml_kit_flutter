import FlutterMacOS

@objc
public class GoogleMlkitGenaiRewritingPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_genai_rewriting",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitGenaiRewritingPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}