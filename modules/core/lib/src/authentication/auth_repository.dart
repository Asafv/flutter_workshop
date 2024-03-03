import 'package:core/core.dart';
import 'package:common_dependencies/common_dependencies.dart';

class AuthRepository {
  /// This will be used to mock last connection status
  final GetStorage _storage = GetStorage();

  final RemoteAuth remoteAuth;
  AuthRepository({required this.remoteAuth});

  bool isLoggedIn() => _storage.read("isLoggedIn") ?? false;

  Future<bool> loginMock() async {
    final isLoggedIn = await remoteAuth.loginMock();
    await _storage.write("isLoggedIn", isLoggedIn);
    return isLoggedIn;
  }

  Future<bool> logoutMock() async {
    final isLoggedOut = await remoteAuth.logoutMock();
    await _storage.write("isLoggedIn", false);
    return isLoggedOut;
  }
}
