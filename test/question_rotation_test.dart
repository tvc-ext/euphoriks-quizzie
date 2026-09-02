import 'dart:convert';

import 'package:curioverse/data/question_banks.dart';
import 'package:curioverse/models/child_profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  test('100-question remote bank is exhausted before any question repeats',
      () async {
    final questions = List.generate(100, (index) {
      final difficulty = index < 34
          ? 'easy'
          : index < 67
              ? 'medium'
              : 'hard';
      return <String, Object>{
        'id': 'moon_phases.q${index.toString().padLeft(3, '0')}',
        'prompt': 'Unique moon question ${index + 1}?',
        'options': const ['Correct', 'Wrong A', 'Wrong B'],
        'correctIndex': 0,
        'explanation': 'Explanation ${index + 1}.',
        'difficulty': difficulty,
      };
    });
    final payload = jsonEncode(<String, Object>{'questions': questions});
    final client = MockClient(
      (_) async => http.Response(payload, 200),
    );

    final seen = <String>{};
    for (var sessionNumber = 0; sessionNumber < 10; sessionNumber++) {
      final session = await createRemoteQuizSession(
        'moon_phases',
        ageBand: AgeBand.adventurer9to11,
        client: client,
      );
      expect(session, hasLength(10));
      expect(session.map((question) => question.id).toSet(), hasLength(10));
      expect(
        session.where((question) => seen.contains(question.id)),
        isEmpty,
        reason: 'session ${sessionNumber + 1} repeated a seen question',
      );
      seen.addAll(session.map((question) => question.id));
    }

    expect(seen, hasLength(100));

    final recycledSession = await createRemoteQuizSession(
      'moon_phases',
      ageBand: AgeBand.adventurer9to11,
      client: client,
    );
    expect(recycledSession, hasLength(10));
    expect(
      recycledSession.any((question) => seen.contains(question.id)),
      isTrue,
    );
  });
}
