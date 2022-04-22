import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/users_field_widget.dart';

import '../../../../utils.dart';

void main() {
  late TextEditingController controllerMock;
  late VoidCallback callbackMock;

  setUp(() {
    callbackMock = () {};
    controllerMock = TextEditingController();
  });

  group('Message search field', () {
    testWidgets('search field', (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(
          UsersFieldWidget(
            onSearchMsg: callbackMock,
            searchController: controllerMock,
          ),
        ),
      );

      expect(find.text('Введите имя поиска'), findsOneWidget);

      final typeFinder = find.byWidgetPredicate((widget) {
        if (widget is! Icon) {
          return false;
        }
        return widget.icon == Icons.search;
      });
      expect(typeFinder, findsOneWidget);
    });
  });
}
