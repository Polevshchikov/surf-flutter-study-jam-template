import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/firebase.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';
import 'package:surf_practice_chat_flutter/ui/app/app.dart';
import 'package:surf_practice_chat_flutter/ui/common/error_handlers/default_error_handler.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/chat_screen_model.dart';

/// Widget with dependencies that live all runtime.
class AppDependencies extends StatefulWidget {
  final App app;

  const AppDependencies({required this.app, Key? key}) : super(key: key);

  @override
  State<AppDependencies> createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  late final ChatRepository _chatRepository;
  late final DefaultErrorHandler _defaultErrorHandler;
  late final ChatScreenModel _chatScreenModel;

  @override
  void initState() {
    super.initState();
    _chatRepository = ChatRepositoryFirebase(FirebaseFirestore.instance);
    _defaultErrorHandler = DefaultErrorHandler();

    _chatScreenModel = ChatScreenModel(
      _defaultErrorHandler,
      _chatRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider<ChatScreenModel>(
      create: (_) => _chatScreenModel,
      child: widget.app,
    );
  }
}
