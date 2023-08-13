import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAcW2aJzLSSW00PHeEYFSANq4qEmP10qEk",
            authDomain: "neetprep-infinity.firebaseapp.com",
            projectId: "neetprep-infinity",
            storageBucket: "neetprep-infinity.appspot.com",
            messagingSenderId: "872539788119",
            appId: "1:872539788119:web:050c50507f3bdd2d78a412",
            measurementId: "G-6K3SGC0BC3"));
  } else {
    await Firebase.initializeApp();
  }
}
