import FlutterMacOS

@objc
public class GoogleMlkitBarcodeScanningPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "google_mlkit_barcode_scanning",
      binaryMessenger: registrar.messenger()
    )
    let instance = GoogleMlkitBarcodeScanningPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}