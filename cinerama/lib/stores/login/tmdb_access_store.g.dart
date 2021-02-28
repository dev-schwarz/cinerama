// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_access_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TmdbAccessStore on _TmdbAccessStoreBase, Store {
  final _$stepAtom = Atom(name: '_TmdbAccessStoreBase.step');

  @override
  TmdbAccessStep get step {
    _$stepAtom.reportRead();
    return super.step;
  }

  @override
  set step(TmdbAccessStep value) {
    _$stepAtom.reportWrite(value, super.step, () {
      super.step = value;
    });
  }

  final _$permissionDataAtom =
      Atom(name: '_TmdbAccessStoreBase.permissionData');

  @override
  TmdbAccessPermissionData get permissionData {
    _$permissionDataAtom.reportRead();
    return super.permissionData;
  }

  @override
  set permissionData(TmdbAccessPermissionData value) {
    _$permissionDataAtom.reportWrite(value, super.permissionData, () {
      super.permissionData = value;
    });
  }

  final _$createRequestTokenAsyncAction =
      AsyncAction('_TmdbAccessStoreBase.createRequestToken');

  @override
  Future<dynamic> createRequestToken() {
    return _$createRequestTokenAsyncAction
        .run(() => super.createRequestToken());
  }

  final _$createAccessTokenAsyncAction =
      AsyncAction('_TmdbAccessStoreBase.createAccessToken');

  @override
  Future<dynamic> createAccessToken() {
    return _$createAccessTokenAsyncAction.run(() => super.createAccessToken());
  }

  final _$_TmdbAccessStoreBaseActionController =
      ActionController(name: '_TmdbAccessStoreBase');

  @override
  void setStep(TmdbAccessStep step) {
    final _$actionInfo = _$_TmdbAccessStoreBaseActionController.startAction(
        name: '_TmdbAccessStoreBase.setStep');
    try {
      return super.setStep(step);
    } finally {
      _$_TmdbAccessStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
step: ${step},
permissionData: ${permissionData}
    ''';
  }
}
