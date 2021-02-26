class TmdbUser {
  TmdbUser({this.data, this.credentials});

  TmdbUserData data;
  TmdbUserCredentials credentials;

  bool get hasUserLoggedIn => data != null && (credentials?.loginDataOk ?? false);
}

class TmdbUserData {
  TmdbUserData({this.id, this.name, this.username});

  final int id;
  final String name;
  final String username;
}

class TmdbUserCredentials {
  TmdbUserCredentials({this.sessionId, this.accountId, this.accessToken});

  final String sessionId;
  final String accountId;
  final String accessToken;

  bool get loginDataOk =>
      (sessionId?.isNotEmpty ?? false) &&
      (accountId?.isNotEmpty ?? false) &&
      (accessToken?.isNotEmpty ?? false);
}
