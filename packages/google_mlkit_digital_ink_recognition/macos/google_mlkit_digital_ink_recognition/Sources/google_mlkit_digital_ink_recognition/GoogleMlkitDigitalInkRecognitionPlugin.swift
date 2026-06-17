import FlutterMacOS

@objc
public class GoogleMlkitDigitalInkRecognitionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_digital_ink_recognizer",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitDigitalInkRecognitionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}