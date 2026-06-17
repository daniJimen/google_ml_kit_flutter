import FlutterMacOS

@objc
public class GoogleMlkitImageLabelingPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_image_labeler",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitImageLabelingPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}