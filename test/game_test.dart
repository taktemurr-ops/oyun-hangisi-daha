import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hangisi_daha/oyun_hangisi_daha.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hangisiDahaConfig.title.length, 33);
    expect(hangisiDahaConfig.tagline.length, 33);
    for (final s in hangisiDahaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hangisiDahaConfig.gameId, hangisiDahaId);
    expect(hangisiDahaRules.gameId, hangisiDahaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hangisiDahaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hangisiDahaId, optionalMechanics: hangisiDahaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hangisiDahaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
