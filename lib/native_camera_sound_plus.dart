import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Plays the sounds the system camera makes, such as the shutter click.
///
/// On Android the sounds come from `MediaActionSound`, on iOS from the system
/// sounds of the Camera app. Each call returns once the sound has started.
abstract final class NativeCameraSound {
  /// The channel to the platform side.
  @visibleForTesting
  static const channel = MethodChannel('native_camera_sound_plus');

  /// Plays the shutter click of taking a photo.
  static Future<void> playShutter() => channel.invokeMethod('playShutter');

  /// Plays the sound of starting a video recording.
  static Future<void> playStartRecord() =>
      channel.invokeMethod('playStartRecord');

  /// Plays the sound of stopping a video recording.
  static Future<void> playStopRecord() =>
      channel.invokeMethod('playStopRecord');
}
