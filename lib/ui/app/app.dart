import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_chat_flutter/ui/common/error_handlers/default_error_handler.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: Provider<ErrorHandler>(
        create: (_) => DefaultErrorHandler(),
        child: const ChatScreen(),
      ),
    );
  }
}
