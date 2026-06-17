import FlutterMacOS

@objc
public class GoogleMlkitGenaiPromptPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_genai_prompt",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitGenaiPromptPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}