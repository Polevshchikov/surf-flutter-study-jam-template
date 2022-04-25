import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/ui/screens/chat/widgets/card_users_widget.dart';

void main() {
  // group('CardUsersWidget test', () {
  //   testWidgets('Card user', (tester) async {
  //     await tester.pumpWidget(
  //       makeTestableWidget(
  //         ChatFieldWidget(
  //           sendMsg: () {},
  //           msgController: TextEditingController(),
  //         ),
  //       ),
  //     );
  //
  //     expect(find.text('Сообщение'), findsOneWidget);
  //
  //     final typeFinderSend = find.byWidgetPredicate((widget) {
  //       if (widget is! Icon) {
  //         return false;
  //       }
  //       return widget.icon == Icons.send;
  //     });
  //     expect(typeFinderSend, findsOneWidget);
  //
  //     final typeFinderLocation = find.byWidgetPredicate((widget) {
  //       if (widget is! Icon) {
  //         return false;
  //       }
  //       return widget.icon == Icons.share_location_outlined;
  //     });
  //     expect(typeFinderLocation, findsOneWidget);
  //   });
  // });

  group('CardUsersWidget golden test', () {
    testGoldens('CardUsersWidget', (tester) async {
      final builder = GoldenBuilder.column();

      builder
        ..addScenario(
          'Local user card',
          CardUsersWidget(
            chatMessage: ChatMessageDto(
              author: ChatUserLocalDto(name: 'Local user'),
              message: 'Hello users',
              createdDateTime: DateTime.utc(2022, 2, 22, 20, 18, 04),
            ),
          ),
        )
        ..addScenario(
          'Remove user card',
          CardUsersWidget(
            chatMessage: ChatMessageDto(
              author: const ChatUserDto(name: 'Remove user'),
              message: 'Hello users',
              createdDateTime: DateTime.utc(2022, 2, 22, 20, 18, 04),
            ),
          ),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(420, 300),
      );

      await screenMatchesGolden(tester, 'card_users_widget user card');
    });
  });
}
