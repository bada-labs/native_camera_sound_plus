import 'package:flutter_test/flutter_test.dart';
import 'package:native_camera_sound_plus/native_camera_sound_plus.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final calledMethods = <String>[];

  setUp(() {
    calledMethods.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(NativeCameraSound.channel, (call) async {
      calledMethods.add(call.method);
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(NativeCameraSound.channel, null);
  });

  test('each sound calls its platform method', () async {
    await NativeCameraSound.playShutter();
    await NativeCameraSound.playStartRecord();
    await NativeCameraSound.playStopRecord();

    expect(calledMethods, ['playShutter', 'playStartRecord', 'playStopRecord']);
  });
}
