import 'package:curioverse/data/profile_store.dart';
import 'package:curioverse/main.dart';
import 'package:curioverse/models/child_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const generateStoreGoldens =
    bool.fromEnvironment('GENERATE_STORE_GOLDENS', defaultValue: false);

void main() {
  Future<void> configurePhone(WidgetTester tester) async {
    tester.view.physicalSize = const Size(720, 1280);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  Widget captureBoundary(Widget child) => RepaintBoundary(
        key: const ValueKey('store-capture'),
        child: child,
      );

  testWidgets(
    'render real Euphoriks Quizzie store screenshots',
    (tester) async {
      await configurePhone(tester);

      await tester.pumpWidget(
        captureBoundary(
          CurioVerseApp(
            showSplash: false,
            profileStore: MemoryProfileStore(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byKey(const ValueKey('store-capture')),
        matchesGoldenFile('goldens/store/01-welcome-to-quizzie.png'),
      );

      const profile = ChildProfile(
        ageBand: AgeBand.adventurer9to11,
        avatarId: 'astro_owl',
      );
      await tester.pumpWidget(
        captureBoundary(
          CurioVerseApp(
            showSplash: false,
            profileStore: MemoryProfileStore(profile),
            initialProfile: profile,
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byKey(const ValueKey('store-capture')),
        matchesGoldenFile('goldens/store/02-home-learning-worlds.png'),
      );

      await tester.tap(find.text('Explore'));
      await tester.pumpAndSettle();
      await expectLater(
        find.byKey(const ValueKey('store-capture')),
        matchesGoldenFile('goldens/store/03-learning-adventures.png'),
      );

      await tester.tap(find.text('Games'));
      await tester.pumpAndSettle();
      await expectLater(
        find.byKey(const ValueKey('store-capture')),
        matchesGoldenFile('goldens/store/04-brain-arcade.png'),
      );
    },
    skip: !generateStoreGoldens,
  );
}
