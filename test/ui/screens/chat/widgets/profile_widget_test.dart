// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/profile_widget.dart';

void main() {
  testGoldens('ProfileWidget', (tester) async {
    final builder = GoldenBuilder.column();

    builder
      ..addScenario(
        'Profile info empty',
        ProfileWidget(
          nickNameController: TextEditingController(),
        ),
      )
      ..addScenario(
        'Profile info',
        ProfileWidget(
          nickNameController: TextEditingController(text: 'User'),
        ),
      );

    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: const Size(300, 740),
    );

    await screenMatchesGolden(tester, 'profile_widget profile info');
  });
}
