Pod::Spec.new do |s|
  s.name             = 'native_camera_sound_plus'
  s.version          = '1.0.0'
  s.summary          = 'Plays the system camera shutter and video recording sounds.'
  s.homepage         = 'https://github.com/bada-labs/native_camera_sound_plus'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Bada Labs' => 'cs@badalabs.com' }
  s.source           = { :http => 'https://github.com/bada-labs/native_camera_sound_plus' }
  s.source_files     = 'native_camera_sound_plus/Sources/native_camera_sound_plus/**/*.swift'
  s.resource_bundles = {
    'native_camera_sound_plus_privacy' => ['native_camera_sound_plus/Sources/native_camera_sound_plus/PrivacyInfo.xcprivacy']
  }
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
