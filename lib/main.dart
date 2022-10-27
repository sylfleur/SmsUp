import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/auth/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (!kReleaseMode) {
    // FirebaseFirestore.instance.useFirestoreEmulator(
    //   Platform.isAndroid ? '10.0.2.2' : 'localhost',
    //   8880,
    // );
    FirebaseFirestore.instance.settings = Settings(
      host: Platform.isAndroid ? '10.0.2.2:8880' : 'localhost:8880',
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: const SignUp(),
    );
  }
}
