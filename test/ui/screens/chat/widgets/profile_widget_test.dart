import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/profile_widget.dart';

void main() {
  group('ProfileWidget golden test', () {
    testGoldens('ProfileWidget', (tester) async {
      final builder = GoldenBuilder.column();

      builder
        ..addScenario(
          'Unfocus field',
          ProfileWidget(
            nickNameController: TextEditingController(),
          ),
        )
        ..addScenario(
          'Unfocus with input',
          ProfileWidget(
              nickNameController: TextEditingController(text: 'User')),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(420, 300),
      );

      await screenMatchesGolden(tester, 'profile_widget unfocus field');
    });
  });
}
