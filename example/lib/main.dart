import 'package:flutter/widgets.dart';
import 'package:native_camera_sound_plus/native_camera_sound_plus.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xFF000000),
      builder: (context, child) => const ColoredBox(
        color: Color(0xFFFFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SoundButton('Shutter', NativeCameraSound.playShutter),
            _SoundButton('Start recording', NativeCameraSound.playStartRecord),
            _SoundButton('Stop recording', NativeCameraSound.playStopRecord),
          ],
        ),
      ),
    );
  }
}

class _SoundButton extends StatelessWidget {
  const _SoundButton(this.label, this.play);

  final String label;
  final Future<void> Function() play;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: play,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        color: const Color(0xFF1E88E5),
        child: Text(label, style: const TextStyle(color: Color(0xFFFFFFFF))),
      ),
    );
  }
}
