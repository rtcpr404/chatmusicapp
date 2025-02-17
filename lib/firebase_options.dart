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
    apiKey: 'AIzaSyAO32RS1Vn6Mcc-nOoOiYUol5Z-U-hgZQk',
    appId: '1:606246231273:web:3a98f3a8c211bdc4722478',
    messagingSenderId: '606246231273',
    projectId: 'projectchatmusic-e4e0a',
    authDomain: 'projectchatmusic-e4e0a.firebaseapp.com',
    storageBucket: 'projectchatmusic-e4e0a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8dMbKJJ_YLKd-3owFUMsfoON2n9DrBck',
    appId: '1:606246231273:android:f13af94a8ecbf2e7722478',
    messagingSenderId: '606246231273',
    projectId: 'projectchatmusic-e4e0a',
    storageBucket: 'projectchatmusic-e4e0a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnbMjj9ytzC_POLxNcP78yGsI2Bxybq7s',
    appId: '1:606246231273:ios:8084a06e48a3bc2d722478',
    messagingSenderId: '606246231273',
    projectId: 'projectchatmusic-e4e0a',
    storageBucket: 'projectchatmusic-e4e0a.appspot.com',
    iosBundleId: 'com.example.chatmusicapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnbMjj9ytzC_POLxNcP78yGsI2Bxybq7s',
    appId: '1:606246231273:ios:8084a06e48a3bc2d722478',
    messagingSenderId: '606246231273',
    projectId: 'projectchatmusic-e4e0a',
    storageBucket: 'projectchatmusic-e4e0a.appspot.com',
    iosBundleId: 'com.example.chatmusicapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAO32RS1Vn6Mcc-nOoOiYUol5Z-U-hgZQk',
    appId: '1:606246231273:web:7828c1c07bb01bc4722478',
    messagingSenderId: '606246231273',
    projectId: 'projectchatmusic-e4e0a',
    authDomain: 'projectchatmusic-e4e0a.firebaseapp.com',
    storageBucket: 'projectchatmusic-e4e0a.appspot.com',
  );
}
