import FlutterMacOS

@objc
public class GoogleMlkitGenaiProofreadingPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_genai_proofreading",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitGenaiProofreadingPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}