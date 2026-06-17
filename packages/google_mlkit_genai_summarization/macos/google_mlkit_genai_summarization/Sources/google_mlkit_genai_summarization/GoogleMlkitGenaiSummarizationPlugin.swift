import FlutterMacOS

@objc
public class GoogleMlkitGenaiSummarizationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_genai_summarization",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitGenaiSummarizationPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}