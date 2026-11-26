import AudioToolbox
import Flutter

/// Plays the system camera sounds.
public final class NativeCameraSoundPlusPlugin: NSObject, FlutterPlugin {
  private static let systemSoundByMethod: [String: SystemSoundID] = [
    "playShutter": 1108,
    "playStartRecord": 1117,
    "playStopRecord": 1118,
  ]

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "native_camera_sound_plus",
      binaryMessenger: registrar.messenger()
    )
    registrar.addMethodCallDelegate(NativeCameraSoundPlusPlugin(), channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let systemSound = Self.systemSoundByMethod[call.method] else {
      result(FlutterMethodNotImplemented)
      return
    }
    AudioServicesPlaySystemSound(systemSound)
    result(nil)
  }
}
