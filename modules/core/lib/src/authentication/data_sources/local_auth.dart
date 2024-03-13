import 'dart:math';

class LocalAuth {
  // mock biometric request for biometric login
  Future<bool> biometricMock() async {
    await Future.delayed(Duration(seconds: 2));
    // 35% change or failing
    return Random().nextInt(100) > 35;
  }
}
