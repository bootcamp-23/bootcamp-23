import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yildizlar/src/core/constants/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yildizlar/src/core/services/auth_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes,
      theme: ThemeData(fontFamily: 'Sora'),
      initialRoute: ref.read(firebaseAuthProvider).currentUser != null ? "loginPage" : "home",
    );
  }
}