import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/firebase.dart';
import 'package:surf_practice_chat_flutter/firebase_options.dart';
import 'package:surf_practice_chat_flutter/screens/chat/chat.dart';
import 'package:surf_practice_chat_flutter/screens/chat/cubit/chat_cubit.dart';
import 'package:surf_practice_chat_flutter/screens/chat/cubit/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(
      androidKey: 'AIzaSyDiTyxvZieD7lPbqoUFuWBBAUKLRY67nGo',
      iosKey: 'AIzaSyDpORod7rluMMBR2NYoe_KN6sIY5JYQ8uU',
      webKey: 'AIzaSyDOcNtYxrE44pR6785ahQv7CdAaFOTUhgA',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatRepository = ChatRepositoryFirebase(FirebaseFirestore.instance);

    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ChatCubit(chatRepository),
          ),
          BlocProvider(
            create: (_) => ProfileCubit(),
          ),
        ],
        child: const ChatScreen(),
      ),
    );
  }
}
