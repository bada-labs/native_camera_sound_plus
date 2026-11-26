import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:native_camera_sound_plus/native_camera_sound_plus.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('every sound plays and returns', (tester) async {
    const timeout = Duration(seconds: 5);
    for (var repeat = 0; repeat < 3; repeat++) {
      await NativeCameraSound.playShutter().timeout(timeout);
      await NativeCameraSound.playStartRecord().timeout(timeout);
      await NativeCameraSound.playStopRecord().timeout(timeout);
    }
  });
}
