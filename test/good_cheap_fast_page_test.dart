import 'package:flutter/material.dart';
import 'package:flutter_small_projects/good_cheap_fast/good_cheap_fast_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GoodCheapFast', () {
    final goodFinder = find.byKey(Key('switch_good'));
    final cheapFinder = find.byKey(Key('switch_cheap'));
    final fastFinder = find.byKey(Key('switch_fast'));
    testWidgets('Finds 3 SwitchListTipe widgets', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: GoodCheapFastPage()));

      expect(find.byType(SwitchListTile), findsNWidgets(3));
    });

    testWidgets('On start all options should be not toggled', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: GoodCheapFastPage()));

      await tester.ensureVisible(goodFinder);
      await tester.ensureVisible(cheapFinder);
      await tester.ensureVisible(fastFinder);

      expect(_isChecked(goodFinder), false);
      expect(_isChecked(cheapFinder), false);
      expect(_isChecked(fastFinder), false);
    });
    testWidgets('Select two options works fine', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: GoodCheapFastPage()));

      final goodFinder = find.byKey(Key('switch_good'));
      final cheapFinder = find.byKey(Key('switch_cheap'));
      final fastFinder = find.byKey(Key('switch_fast'));

      await tester.ensureVisible(goodFinder);
      await tester.tap(goodFinder);

      await tester.ensureVisible(cheapFinder);
      await tester.tap(cheapFinder);
      await tester.pumpAndSettle();

      expect(_isChecked(goodFinder), true);
      expect(_isChecked(cheapFinder), true);
      expect(_isChecked(fastFinder), false);
    });

    testWidgets('Good and fast cannot be cheap', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: GoodCheapFastPage()));

      final goodFinder = find.byKey(Key('switch_good'));
      final cheapFinder = find.byKey(Key('switch_cheap'));
      final fastFinder = find.byKey(Key('switch_fast'));

      await tester.ensureVisible(goodFinder);
      await tester.tap(goodFinder);

      await tester.ensureVisible(cheapFinder);
      await tester.tap(cheapFinder);
      await tester.pumpAndSettle();

      expect(_isChecked(goodFinder), true);
      expect(_isChecked(cheapFinder), true);

      await tester.ensureVisible(fastFinder);
      await tester.tap(fastFinder);

      await tester.pumpAndSettle();

      expect(_isChecked(goodFinder), true);
      expect(_isChecked(cheapFinder), false);
      expect(_isChecked(fastFinder), true);
    });
  });
}

bool _isChecked(Finder finder) {
  return (finder.evaluate().single.widget as SwitchListTile).value;
}
