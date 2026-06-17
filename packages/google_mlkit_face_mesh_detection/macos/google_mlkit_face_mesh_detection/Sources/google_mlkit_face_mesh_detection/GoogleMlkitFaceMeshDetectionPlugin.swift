import FlutterMacOS

@objc
public class GoogleMlkitFaceMeshDetectionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_face_mesh_detector",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitFaceMeshDetectionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}