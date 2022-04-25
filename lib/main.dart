import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/firebase_options.dart';
import 'package:surf_practice_chat_flutter/ui/app/app.dart';
import 'package:surf_practice_chat_flutter/ui/app/app_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(
      androidKey: 'AIzaSyDiTyxvZieD7lPbqoUFuWBBAUKLRY67nGo',
      iosKey: 'AIzaSyDpORod7rluMMBR2NYoe_KN6sIY5JYQ8uU',
      webKey: 'AIzaSyDOcNtYxrE44pR6785ahQv7CdAaFOTUhgA',
    ),
  );

  runApp(
    const AppDependencies(
      app: App(),
    ),
  );
}
