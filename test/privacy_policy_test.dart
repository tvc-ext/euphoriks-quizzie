import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:curioverse/screens/privacy_policy_screen.dart';
import 'package:curioverse/screens/onboarding_screen.dart';

void main() {
  testWidgets('privacy policy is accessible before profile creation', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: OnboardingScreen(onComplete: (_) async {}),
    ));
    await tester.tap(find.text('Privacy policy'));
    await tester.pumpAndSettle();
    expect(find.byType(PrivacyPolicyScreen), findsOneWidget);
    expect(find.byType(SelectableText), findsOneWidget);
    final text = tester.widget<SelectableText>(find.byType(SelectableText));
    expect(text.data, contains('Euphoriks Quizzie privacy policy'));
    expect(text.data, contains('https://tvc-ext.github.io/euphoriks-quizzie/privacy/'));
  });
}
