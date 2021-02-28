// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool> _$hasUserComputed;

  @override
  bool get hasUser => (_$hasUserComputed ??=
          Computed<bool>(() => super.hasUser, name: '_LoginStoreBase.hasUser'))
      .value;

  final _$loginStepAtom = Atom(name: '_LoginStoreBase.loginStep');

  @override
  LoginStep get loginStep {
    _$loginStepAtom.reportRead();
    return super.loginStep;
  }

  @override
  set loginStep(LoginStep value) {
    _$loginStepAtom.reportWrite(value, super.loginStep, () {
      super.loginStep = value;
    });
  }

  final _$userAtom = Atom(name: '_LoginStoreBase.user');

  @override
  TmdbUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(TmdbUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$loginFakeUserAsyncAction =
      AsyncAction('_LoginStoreBase.loginFakeUser');

  @override
  Future<dynamic> loginFakeUser(bool mainUser) {
    return _$loginFakeUserAsyncAction.run(() => super.loginFakeUser(mainUser));
  }

  final _$loginAndSaveFakeUserAsyncAction =
      AsyncAction('_LoginStoreBase.loginAndSaveFakeUser');

  @override
  Future<dynamic> loginAndSaveFakeUser(bool mainUser) {
    return _$loginAndSaveFakeUserAsyncAction
        .run(() => super.loginAndSaveFakeUser(mainUser));
  }

  final _$logoutAsyncAction = AsyncAction('_LoginStoreBase.logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_loginAsyncAction = AsyncAction('_LoginStoreBase._login');

  @override
  Future<dynamic> _login(TmdbUserCredentials credentials) {
    return _$_loginAsyncAction.run(() => super._login(credentials));
  }

  final _$retryLoginCurrentUserAsyncAction =
      AsyncAction('_LoginStoreBase.retryLoginCurrentUser');

  @override
  Future<dynamic> retryLoginCurrentUser() {
    return _$retryLoginCurrentUserAsyncAction
        .run(() => super.retryLoginCurrentUser());
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setUser(TmdbUser user) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loginStep: ${loginStep},
user: ${user},
hasUser: ${hasUser}
    ''';
  }
}
