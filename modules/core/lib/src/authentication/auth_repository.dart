import 'package:core/core.dart';
import 'package:common_dependencies/common_dependencies.dart';

const String kIsLoggedIn = "isLoggedIn";

class AuthRepository {
  /// This will be used to mock last connection status
  final GetStorage _storage = GetStorage();

  final RemoteAuth remoteAuth;
  final LocalAuth localAuth;
  AuthRepository({required this.remoteAuth, required this.localAuth});

  bool isLoggedIn() => _storage.read(kIsLoggedIn) ?? false;

  Future<bool> loginMock() async {
    final isLoggedIn = await remoteAuth.loginMock();
    await _storage.write(kIsLoggedIn, isLoggedIn);
    return isLoggedIn;
  }

  Future<bool> logoutMock() async {
    final isLoggedOut = await remoteAuth.logoutMock();
    await _storage.write(kIsLoggedIn, false);
    return isLoggedOut;
  }

  biometricLogin() async => await localAuth.biometricMock();
}
