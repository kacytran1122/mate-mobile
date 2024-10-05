// Widget test for the reusable NormalButtonCustom button.
//
// The old default test that shipped with the Flutter template exercised a
// counter screen that this app does not have, so it could never compile or
// pass. This replacement drives a real widget from the code base: it verifies
// the button renders its label and that a tap invokes the supplied callback.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mate_project/widgets/form/normal_button_custom.dart';

Widget _wrap(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(360, 800),
    builder: (context, _) => MaterialApp(
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets('NormalButtonCustom shows its label', (WidgetTester tester) async {
    await tester.pumpWidget(
      _wrap(
        NormalButtonCustom(
          name: 'Continue',
          action: () {},
          background: Colors.blue,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('NormalButtonCustom fires its action when tapped',
      (WidgetTester tester) async {
    var tapped = 0;

    await tester.pumpWidget(
      _wrap(
        NormalButtonCustom(
          name: 'Submit',
          action: () => tapped++,
          background: Colors.green,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(NormalButtonCustom));
    await tester.pump();

    expect(tapped, 1);
  });
}
