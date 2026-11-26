## 1.0.0

First release as `native_camera_sound_plus`, the maintained successor of `native_camera_sound` 0.0.4.

- Every call returns. Before, the platform side never answered, so awaiting a sound waited forever.
- Android keeps one `MediaActionSound`, loads the sounds when the plugin starts and releases it when the engine detaches. Before, every call created a new one that was never released, and the first sound of each could lag while it loaded.
- Android builds with the current Gradle plugin and Java 17, and no longer pins `compileSdk` to 31, which broke apps whose other dependencies need API 34 or later. The Android code is Java, so it builds with Android Gradle plugin 8 and 9 alike.
- iOS includes a privacy manifest and supports both CocoaPods and Swift Package Manager.
- Unknown methods report `notImplemented` on iOS too.
