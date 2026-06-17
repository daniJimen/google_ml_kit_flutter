import FlutterMacOS

@objc
public class GoogleMlkitTextRecognitionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_text_recognizer",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitTextRecognitionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}