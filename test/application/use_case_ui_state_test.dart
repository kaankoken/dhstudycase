import 'package:delivery_hero_flutter_study_case/presentation/core/ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

final exampleState = StateProvider<UIState<String, void>>((ref) => const UIState.idle());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer(builder: (context, ref, _) {
        final provider = ref.watch(exampleState);

        return ElevatedButton(
          onPressed: () {
            ref.read(exampleState.notifier).update((_) => const UIState.loading());
          },
          child: Text('$provider'),
        );
      }),
    );
  }
}

void main() {
  testWidgets(
    'Update the UI when change the state status',
    (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      expect(find.text('UIState<String, void>.idle()'), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('UIState<String, void>.loading()'), findsOneWidget);
    },
  );
}
