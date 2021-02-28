import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/tmdb_user.dart';
import '../../services/prefs_service.dart';
import '../../services/tmdb_service.dart';

part 'login_store.g.dart';

enum LoginStep {
  starting,
  userLogged,
  pending,
}

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  _LoginStoreBase({bool clearUserData = false}) {
    if (clearUserData) {
      logout().whenComplete(() {
        _autoLoginCurrentUser();
      });
    } else {
      _autoLoginCurrentUser();
    }
  }

  final PrefsService _prefs = Modular.get<PrefsService>();
  final TmdbService _tmdb = Modular.get<TmdbService>();

  @observable
  LoginStep loginStep = LoginStep.starting;

  @observable
  TmdbUser user;

  @action
  void setUser(TmdbUser user) => this.user = user;

  @computed
  bool get hasUser => user?.hasUserLoggedIn ?? false;

  @action
  Future loginFakeUser(bool mainUser) async {
    final TmdbUserCredentials credentials = TmdbUserCredentials(
      sessionId:
          (mainUser ?? true) ? _LoginConstants.fakeSessionId : _LoginConstants.fakeSessionId2,
      accountId:
          (mainUser ?? true) ? _LoginConstants.fakeAccountId : _LoginConstants.fakeAccountId2,
      accessToken:
          (mainUser ?? true) ? _LoginConstants.fakeAccessToken : _LoginConstants.fakeAccessToken2,
    );
    await _login(credentials);
    loginStep = LoginStep.userLogged;
  }

  @action
  Future loginAndSaveFakeUser(bool mainUser) async {
    final TmdbUserCredentials credentials = TmdbUserCredentials(
      sessionId:
          (mainUser ?? true) ? _LoginConstants.fakeSessionId : _LoginConstants.fakeSessionId2,
      accountId:
          (mainUser ?? true) ? _LoginConstants.fakeAccountId : _LoginConstants.fakeAccountId2,
      accessToken:
          (mainUser ?? true) ? _LoginConstants.fakeAccessToken : _LoginConstants.fakeAccessToken2,
    );
    await _saveCredentials(credentials);
    _autoLoginCurrentUser();
    // _login(credentials);
    // loginStep = LoginStep.starting;
  }

  @action
  Future logout() async {
    await _prefs.prefs.remove(PrefsKeys.loginSessionId);
    await _prefs.prefs.remove(PrefsKeys.loginAccountId);
    await _prefs.prefs.remove(PrefsKeys.loginAccessToken);

    setUser(null);
    loginStep = LoginStep.pending;
  }

  @action
  Future _login(TmdbUserCredentials credentials) async {
    _tmdb.api.loginAll(
      credentials.sessionId,
      credentials.accountId,
      credentials.accessToken,
    );

    final AccountDetails accountDetails = await _tmdb.api.account.getDetails();
    // loginStep = LoginStep.userLogged;
    setUser(_mapAccountDetailsToUser(accountDetails, credentials));
  }

  @action
  Future retryLoginCurrentUser() async {
    _autoLoginCurrentUser();
  }

  void _autoLoginCurrentUser() {
    final TmdbUserCredentials credentials = _loadCredentials();
    if (credentials != null) {
      _login(credentials);
      loginStep = LoginStep.userLogged;
    } else {
      loginStep = LoginStep.pending;
    }
  }

  /// Load the current user credentials data saved on the [SharedPreferences],
  /// and returns a [TmdbUserCredentials] object. If there is no user data
  /// saved, returns `null`.
  TmdbUserCredentials _loadCredentials() {
    const loginKeys = const <String>[
      PrefsKeys.loginSessionId,
      PrefsKeys.loginAccountId,
      PrefsKeys.loginAccessToken,
    ];

    return _prefs.prefs.getKeys().containsAll(loginKeys)
        ? TmdbUserCredentials(
            sessionId: _prefs.load<String>(PrefsKeys.loginSessionId, null),
            accountId: _prefs.load<String>(PrefsKeys.loginAccountId, null),
            accessToken: _prefs.load<String>(PrefsKeys.loginAccessToken, null),
          )
        : null;
  }

  /// Save the user [credentials] data on the [SharedPreferences].
  Future _saveCredentials(TmdbUserCredentials credentials) async {
    await _prefs.save<String>(PrefsKeys.loginSessionId, credentials.sessionId);
    await _prefs.save<String>(PrefsKeys.loginAccountId, credentials.accountId);
    await _prefs.save<String>(PrefsKeys.loginAccessToken, credentials.accessToken);
  }

  TmdbUser _mapAccountDetailsToUser(
      AccountDetails accountDetails, TmdbUserCredentials credentials) {
    return TmdbUser(
      data: TmdbUserData(
        id: accountDetails.id,
        name: accountDetails.name,
        username: accountDetails.username,
      ),
      credentials: credentials,
    );
  }
}

class _LoginConstants {
  const _LoginConstants._();

  static const redirectToV4 = r'''http://__authorized_v4__.tmdb''';

  static const requestTokenPart = '{{REQUEST_TOKEN}}';

  static const authBaseUrlV4 = 'https://www.themoviedb.org'
      '/auth/access'
      '?request_token=$requestTokenPart';

  static const fakeSessionId = r'''e1bd92f910495860302e00f4a97668a233ab8b66''';
  static const fakeAccountId = r'''5eb4bb017ac8290022228128''';
  static const fakeAccessToken =
      r'''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2MDQ2MzI0NDksInN1YiI6IjVlYjRiYjAxN2FjODI5MDAyMjIyODEyOCIsImp0aSI6IjI1MzI1NzgiLCJhdWQiOiJmZmVhNGNhMTA5OWM2Zjk0NWNmZTkxMmUwODA1NmJlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.nLFgA3mCMoUHFy4xbE5F3CJTpLfzUvjPlDye9eae0io''';

  static const fakeSessionId2 = r'''1a559276455b0f6cab9322a5d420271c9e10450d''';
  static const fakeAccountId2 = r'''5d3fa5e934e1521fb8e79d51''';
  static const fakeAccessToken2 =
      r'''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIyODU0NzI5Iiwic2NvcGVzIjpbImFwaV9yZWFkIiwiYXBpX3dyaXRlIl0sIm5iZiI6MTYxNDQ3ODQ0MCwiYXVkIjoiZmZlYTRjYTEwOTljNmY5NDVjZmU5MTJlMDgwNTZiZTIiLCJzdWIiOiI1ZDNmYTVlOTM0ZTE1MjFmYjhlNzlkNTEiLCJ2ZXJzaW9uIjoxfQ._g3oznlj347twCkyKo4j2SohaSGmDUgi5f3lUjV4PL8''';
}
