import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBZN7J9lgz9ayvSnWKTeRSkBXLM4u-ssII",
            authDomain: "quizzapp-8befd.firebaseapp.com",
            projectId: "quizzapp-8befd",
            storageBucket: "quizzapp-8befd.appspot.com",
            messagingSenderId: "12457145060",
            appId: "1:12457145060:web:8a2b8520c6d203cd1fb2f1",
            measurementId: "G-T4YWZ9RJXT"));
  } else {
    await Firebase.initializeApp();
  }
}
