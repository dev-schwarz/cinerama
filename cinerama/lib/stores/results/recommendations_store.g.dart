// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecommendationsMoviesStore on _RecommendationsMoviesStoreBase, Store {
  final _$sortByAtom = Atom(name: '_RecommendationsMoviesStoreBase.sortBy');

  @override
  MovieRecommendationsSortBy get sortBy {
    _$sortByAtom.reportRead();
    return super.sortBy;
  }

  @override
  set sortBy(MovieRecommendationsSortBy value) {
    _$sortByAtom.reportWrite(value, super.sortBy, () {
      super.sortBy = value;
    });
  }

  final _$_RecommendationsMoviesStoreBaseActionController =
      ActionController(name: '_RecommendationsMoviesStoreBase');

  @override
  void setSortBy(MovieRecommendationsSortBy sortBy) {
    final _$actionInfo = _$_RecommendationsMoviesStoreBaseActionController
        .startAction(name: '_RecommendationsMoviesStoreBase.setSortBy');
    try {
      return super.setSortBy(sortBy);
    } finally {
      _$_RecommendationsMoviesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sortBy: ${sortBy}
    ''';
  }
}

mixin _$RecommendationsTvsStore on _RecommendationsTvsStoreBase, Store {
  final _$sortByAtom = Atom(name: '_RecommendationsTvsStoreBase.sortBy');

  @override
  TvRecommendationsSortBy get sortBy {
    _$sortByAtom.reportRead();
    return super.sortBy;
  }

  @override
  set sortBy(TvRecommendationsSortBy value) {
    _$sortByAtom.reportWrite(value, super.sortBy, () {
      super.sortBy = value;
    });
  }

  final _$_RecommendationsTvsStoreBaseActionController =
      ActionController(name: '_RecommendationsTvsStoreBase');

  @override
  void setSortBy(TvRecommendationsSortBy sortBy) {
    final _$actionInfo = _$_RecommendationsTvsStoreBaseActionController
        .startAction(name: '_RecommendationsTvsStoreBase.setSortBy');
    try {
      return super.setSortBy(sortBy);
    } finally {
      _$_RecommendationsTvsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sortBy: ${sortBy}
    ''';
  }
}
