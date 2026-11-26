package com.badalabs.native_camera_sound_plus;

import android.media.MediaActionSound;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import java.util.Map;

/** Plays the system camera sounds with one {@link MediaActionSound}. */
public final class NativeCameraSoundPlusPlugin implements FlutterPlugin, MethodCallHandler {
  private static final Map<String, Integer> SOUND_BY_METHOD =
      Map.of(
          "playShutter", MediaActionSound.SHUTTER_CLICK,
          "playStartRecord", MediaActionSound.START_VIDEO_RECORDING,
          "playStopRecord", MediaActionSound.STOP_VIDEO_RECORDING);

  private MethodChannel channel;
  private MediaActionSound mediaActionSound;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    mediaActionSound = new MediaActionSound();
    // Loading ahead keeps the first sound from lagging behind the capture.
    for (int sound : SOUND_BY_METHOD.values()) {
      mediaActionSound.load(sound);
    }
    channel = new MethodChannel(binding.getBinaryMessenger(), "native_camera_sound_plus");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    Integer sound = SOUND_BY_METHOD.get(call.method);
    if (sound == null) {
      result.notImplemented();
      return;
    }
    mediaActionSound.play(sound);
    result.success(null);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
    mediaActionSound.release();
  }
}
