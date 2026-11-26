# native_camera_sound_plus

[![pub package](https://img.shields.io/pub/v/native_camera_sound_plus.svg)](https://pub.dev/packages/native_camera_sound_plus)
[![CI](https://github.com/bada-labs/native_camera_sound_plus/actions/workflows/ci.yaml/badge.svg)](https://github.com/bada-labs/native_camera_sound_plus/actions/workflows/ci.yaml)

Plays the sounds the system camera makes: the shutter click and the start and stop of a video recording. Useful when you capture with your own camera UI and want the familiar feedback.

This is the maintained successor of [`native_camera_sound`](https://pub.dev/packages/native_camera_sound), which has not been updated since 0.0.4 (2025). The API is the same. Bada Labs uses it in its production apps.

## What's different from `native_camera_sound` 0.0.4

- **Calls return.** The original never answered from the platform side, so `await NativeCameraSound.playShutter()` never finished.
- **No leaked players on Android.** One `MediaActionSound` is loaded up front and released with the engine, instead of a new unreleased one per sound, so the first sound does not lag.
- **Builds with current Android tooling.** `compileSdk` is no longer pinned to 31, which made apps with recent AndroidX dependencies fail `checkReleaseAarMetadata`.
- **iOS privacy manifest**, and both CocoaPods and Swift Package Manager.

## Migrating from `native_camera_sound`

1. In `pubspec.yaml`, replace `native_camera_sound` with `native_camera_sound_plus`.
2. Replace `package:native_camera_sound/native_camera_sound.dart` with `package:native_camera_sound_plus/native_camera_sound_plus.dart`.

## Usage

```dart
import 'package:native_camera_sound_plus/native_camera_sound_plus.dart';

await NativeCameraSound.playShutter();
await NativeCameraSound.playStartRecord();
await NativeCameraSound.playStopRecord();
```

| Platform | Source of the sounds |
| --- | --- |
| Android | [`MediaActionSound`](https://developer.android.com/reference/android/media/MediaActionSound), which follows the device's camera sound policy |
| iOS | The Camera app's system sounds 1108, 1117 and 1118. They follow the ringer switch, like other system sounds |

## Scope

This package fixes bugs and keeps up with Flutter changes. New features are considered conservatively to keep it small and dependable.

## Credits

Based on [`native_camera_sound`](https://pub.dev/packages/native_camera_sound) by Bungabear, under the MIT license. Maintained by [Bada Labs](https://badalabs.com).
