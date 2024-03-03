class RemoteAuth {
  Future<bool> loginMock() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  Future<bool> logoutMock() async => true;
}
