import 'package:curioverse/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('splash introduces Euphoriks Quizzie and continues automatically',
      (tester) async {
    var finished = false;
    await tester.pumpWidget(
      MaterialApp(
        home: CurioVerseSplashScreen(onFinished: () => finished = true),
      ),
    );

    expect(find.text('QUIZZIE'), findsOneWidget);
    expect(find.text('by EUPHORIKS'), findsOneWidget);
    expect(find.text('Explore • Play • Learn'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 2200));
    expect(finished, isTrue);
  });
}
