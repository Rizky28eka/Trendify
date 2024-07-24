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
    apiKey: 'AIzaSyD6GifDTfYKUZ5aMZkWHMuLihFU7myXKUk',
    appId: '1:348945422454:web:614bf8c8b6ddf5ffbc6757',
    messagingSenderId: '348945422454',
    projectId: 'trendify-3f4f5',
    authDomain: 'trendify-3f4f5.firebaseapp.com',
    storageBucket: 'trendify-3f4f5.appspot.com',
    measurementId: 'G-0YZ5RBGERB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnfiOa1xK1F5PDWNaTOip6qo3yc-BU53o',
    appId: '1:348945422454:android:674234e9d36da560bc6757',
    messagingSenderId: '348945422454',
    projectId: 'trendify-3f4f5',
    storageBucket: 'trendify-3f4f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDbpCP1pxJ1O47mMqsnAryon74EnQSe4I',
    appId: '1:348945422454:ios:9020d74ed7974505bc6757',
    messagingSenderId: '348945422454',
    projectId: 'trendify-3f4f5',
    storageBucket: 'trendify-3f4f5.appspot.com',
    iosBundleId: 'com.example.trendify2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDbpCP1pxJ1O47mMqsnAryon74EnQSe4I',
    appId: '1:348945422454:ios:9020d74ed7974505bc6757',
    messagingSenderId: '348945422454',
    projectId: 'trendify-3f4f5',
    storageBucket: 'trendify-3f4f5.appspot.com',
    iosBundleId: 'com.example.trendify2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6GifDTfYKUZ5aMZkWHMuLihFU7myXKUk',
    appId: '1:348945422454:web:7980b3e25cfa4672bc6757',
    messagingSenderId: '348945422454',
    projectId: 'trendify-3f4f5',
    authDomain: 'trendify-3f4f5.firebaseapp.com',
    storageBucket: 'trendify-3f4f5.appspot.com',
    measurementId: 'G-P5H8VNLRK9',
  );
}