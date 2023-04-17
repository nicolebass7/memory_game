// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDcPLhttVob2PJmSrp42iax5zMfLVqw82I',
    appId: '1:655046322931:web:cd6c13a54e463cc2ace586',
    messagingSenderId: '655046322931',
    projectId: 'final-project-a819f',
    authDomain: 'final-project-a819f.firebaseapp.com',
    storageBucket: 'final-project-a819f.appspot.com',
    measurementId: 'G-ECH0Q8VSRV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNncdvHvyVuJYu6Gf4bJbpF9ID4M2umMI',
    appId: '1:655046322931:android:f1976af93e3cf6d7ace586',
    messagingSenderId: '655046322931',
    projectId: 'final-project-a819f',
    storageBucket: 'final-project-a819f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAX1JpwaMI27e2v2OEEkyquGt8up3Szz4',
    appId: '1:655046322931:ios:488aa553c2bade0bace586',
    messagingSenderId: '655046322931',
    projectId: 'final-project-a819f',
    storageBucket: 'final-project-a819f.appspot.com',
    androidClientId: '655046322931-kcf8o8jfakijlrgp50q3mrd8sga148q5.apps.googleusercontent.com',
    iosClientId: '655046322931-7gl3eqsnik8q9k41mkbgehvia8cihukr.apps.googleusercontent.com',
    iosBundleId: 'com.example.memoryGame',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAX1JpwaMI27e2v2OEEkyquGt8up3Szz4',
    appId: '1:655046322931:ios:488aa553c2bade0bace586',
    messagingSenderId: '655046322931',
    projectId: 'final-project-a819f',
    storageBucket: 'final-project-a819f.appspot.com',
    androidClientId: '655046322931-kcf8o8jfakijlrgp50q3mrd8sga148q5.apps.googleusercontent.com',
    iosClientId: '655046322931-7gl3eqsnik8q9k41mkbgehvia8cihukr.apps.googleusercontent.com',
    iosBundleId: 'com.example.memoryGame',
  );
}
