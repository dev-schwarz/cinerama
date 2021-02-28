import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../services/prefs_service.dart';
import '../../services/tmdb_service.dart';

part 'tmdb_access_store.g.dart';

class TmdbAccessStore = _TmdbAccessStoreBase with _$TmdbAccessStore;

abstract class _TmdbAccessStoreBase with Store {
  _TmdbAccessStoreBase() {
    createRequestToken();
  }

  final PrefsService _prefs = Modular.get<PrefsService>();
  final TmdbService _tmdb = Modular.get<TmdbService>();

  String _requestToken;
  String _sessionId;
  String _accountId;
  String _accessToken;

  @observable
  TmdbAccessStep step = TmdbAccessStep.initial;

  @action
  void setStep(TmdbAccessStep step) => this.step = step;

  @observable
  TmdbAccessPermissionData permissionData;

  @action
  Future createRequestToken() async {
    setStep(TmdbAccessStep.creatingRequestToken);

    final requestToken = await _tmdb.api.auth4.createRequestToken(
      redirectTo: _TmdbAccessConstants.redirectToV4,
    );

    print('[createRequestToken] : requestToken: $requestToken');

    if (requestToken.isSuccess) {
      _requestToken = requestToken.requestToken;
      permissionData = TmdbAccessPermissionData(
        requestPermissionUrl: _makeAuthUrl(_TmdbAccessConstants.authBaseUrlV4, _requestToken),
        permissionGrantedUrl: _TmdbAccessConstants.redirectToV4,
      );
      setStep(TmdbAccessStep.requestingUserPermission);
    } else {
      setStep(TmdbAccessStep.error);
    }
  }

  @action
  Future createAccessToken() async {
    setStep(TmdbAccessStep.creatingAccessToken);

    final accessToken = await _tmdb.api.auth4.createAccessToken(
      requestToken: _requestToken,
    );

    print('[createAccessToken] : accessToken: $accessToken');

    if (accessToken.isSuccess) {
      _accountId = accessToken.accountId;
      _accessToken = accessToken.accessToken;
      setStep(TmdbAccessStep.creatingSessionId);
      _createSessionId();
    } else {
      setStep(TmdbAccessStep.error);
    }
  }

  Future _createSessionId() async {
    final sessionId = await _tmdb.api.authentication.createSessionIdFromV4(_accessToken);

    print('[createSessionId] : sessionId: $sessionId');

    if (sessionId.sessionId != null && sessionId.sessionId.isNotEmpty) {
      _sessionId = sessionId.sessionId;
      await _saveCredentials();
      print('sessionId: $_sessionId');
      print('accountId: $_accountId');
      print('accessToken: $_accessToken');
      setStep(TmdbAccessStep.completed);
    } else {
      setStep(TmdbAccessStep.error);
    }
  }

  Future _saveCredentials() async {
    await _prefs.save<String>(PrefsKeys.loginSessionId, _sessionId);
    await _prefs.save<String>(PrefsKeys.loginAccountId, _accountId);
    await _prefs.save<String>(PrefsKeys.loginAccessToken, _accessToken);
  }

  String _makeAuthUrl(String url, String requestToken) {
    return url.replaceAll(_TmdbAccessConstants.requestTokenPart, requestToken);
  }
}

class TmdbAccessPermissionData {
  const TmdbAccessPermissionData({
    this.requestPermissionUrl,
    this.permissionGrantedUrl,
  });

  final String requestPermissionUrl;
  final String permissionGrantedUrl;
}

enum TmdbAccessStep {
  initial,
  creatingRequestToken,
  requestingUserPermission,
  creatingAccessToken,
  creatingSessionId,
  completed,
  error,
}

class _TmdbAccessConstants {
  const _TmdbAccessConstants._();

  static const redirectToV4 = r'''http://__authorized_v4__.tmdb''';

  static const requestTokenPart = '{{REQUEST_TOKEN}}';

  static const authBaseUrlV4 = 'https://www.themoviedb.org'
      '/auth/access'
      '?request_token=$requestTokenPart';
}
