import FlutterMacOS

@objc
public class GoogleMlkitGenaiSpeechRecognitionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_genai_speech_recognition",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitGenaiSpeechRecognitionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}