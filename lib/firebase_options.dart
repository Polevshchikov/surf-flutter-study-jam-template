// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions currentPlatform({
    required String webKey,
    required String iosKey,
    required String androidKey,
  }) {
    if (kIsWeb) {
      return web(webKey);
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android(androidKey);
      case TargetPlatform.iOS:
        return ios(iosKey);
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static FirebaseOptions web(String apiKey) => FirebaseOptions(
        apiKey: apiKey,
        appId: '1:885602153748:web:e675eaa5a027823c3fbe01',
        messagingSenderId: '885602153748',
        projectId: 'surf-study-jam',
        authDomain: 'surf-study-jam.firebaseapp.com',
        storageBucket: 'surf-study-jam.appspot.com',
      );

  static FirebaseOptions android(String apiKey) => FirebaseOptions(
        apiKey: apiKey,
        appId: '1:885602153748:android:564cdb30f112f15d3fbe01',
        messagingSenderId: '885602153748',
        projectId: 'surf-study-jam',
        storageBucket: 'surf-study-jam.appspot.com',
      );

  static FirebaseOptions ios(String apiKey) => FirebaseOptions(
        apiKey: apiKey,
        appId: '1:885602153748:ios:a342adea53d4844f3fbe01',
        messagingSenderId: '885602153748',
        projectId: 'surf-study-jam',
        storageBucket: 'surf-study-jam.appspot.com',
        iosClientId: '885602153748-1fhg3064shdav3607omu3oo0ml2hgv5g.apps.googleusercontent.com',
        iosBundleId: 'com.example.surfPracticeChatFlutter',
      );
}
