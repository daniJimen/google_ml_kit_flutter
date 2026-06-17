import FlutterMacOS

@objc
public class GoogleMlkitSubjectSegmentationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_subject_segmenter",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitSubjectSegmentationPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}