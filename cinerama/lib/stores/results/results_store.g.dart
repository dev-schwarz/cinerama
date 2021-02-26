// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResultsStore<T extends TResultsObject<dynamic>>
    on _ResultsStoreBase<T>, Store {
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults,
              name: '_ResultsStoreBase.hasResults'))
          .value;

  final _$resultsAtom = Atom(name: '_ResultsStoreBase.results');

  @override
  T get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(T value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$fetchResultsFutureAtom =
      Atom(name: '_ResultsStoreBase.fetchResultsFuture');

  @override
  ObservableFuture<T> get fetchResultsFuture {
    _$fetchResultsFutureAtom.reportRead();
    return super.fetchResultsFuture;
  }

  @override
  set fetchResultsFuture(ObservableFuture<T> value) {
    _$fetchResultsFutureAtom.reportWrite(value, super.fetchResultsFuture, () {
      super.fetchResultsFuture = value;
    });
  }

  final _$fetchResultsAsyncAction =
      AsyncAction('_ResultsStoreBase.fetchResults');

  @override
  Future<T> fetchResults() {
    return _$fetchResultsAsyncAction.run(() => super.fetchResults());
  }

  final _$fetchResultsNextPageAsyncAction =
      AsyncAction('_ResultsStoreBase.fetchResultsNextPage');

  @override
  Future<T> fetchResultsNextPage() {
    return _$fetchResultsNextPageAsyncAction
        .run(() => super.fetchResultsNextPage());
  }

  @override
  String toString() {
    return '''
results: ${results},
fetchResultsFuture: ${fetchResultsFuture},
hasResults: ${hasResults}
    ''';
  }
}
