// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: '',
    appId: '1:725917311869:web:969566b9b5320054e2a214',
    messagingSenderId: '725917311869',
    projectId: 'deja-brew-e7a8d',
    authDomain: 'deja-brew-e7a8d.firebaseapp.com',
    storageBucket: 'deja-brew-e7a8d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '',
    appId: '1:725917311869:android:f4f600bffc3665a9e2a214',
    messagingSenderId: '725917311869',
    projectId: 'deja-brew-e7a8d',
    storageBucket: 'deja-brew-e7a8d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '',
    appId: '1:725917311869:ios:d9e911bedcff4a87e2a214',
    messagingSenderId: '725917311869',
    projectId: 'deja-brew-e7a8d',
    storageBucket: 'deja-brew-e7a8d.appspot.com',
    iosBundleId: 'com.example.cafeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: '',
    appId: '1:725917311869:ios:d9e911bedcff4a87e2a214',
    messagingSenderId: '725917311869',
    projectId: 'deja-brew-e7a8d',
    storageBucket: 'deja-brew-e7a8d.appspot.com',
    iosBundleId: 'com.example.cafeApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: '',
    appId: '1:725917311869:web:d570a795ca70bda4e2a214',
    messagingSenderId: '725917311869',
    projectId: 'deja-brew-e7a8d',
    authDomain: 'deja-brew-e7a8d.firebaseapp.com',
    storageBucket: 'deja-brew-e7a8d.appspot.com',
  );

}
