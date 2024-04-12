import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAf69kQr1InHNTnAKSBQ-4E7icfFYrYwtA",
            authDomain: "hospital-app-dtqx5n.firebaseapp.com",
            projectId: "hospital-app-dtqx5n",
            storageBucket: "hospital-app-dtqx5n.appspot.com",
            messagingSenderId: "1002470934171",
            appId: "1:1002470934171:web:397bf8acd76189e498a83e"));
  } else {
    await Firebase.initializeApp();
  }
}
