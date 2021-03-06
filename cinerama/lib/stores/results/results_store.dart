import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../services/tmdb_service.dart';

part 'results_store.g.dart';

abstract class ResultsStore<T extends TResultsObject> = _ResultsStoreBase<T> with _$ResultsStore;

abstract class _ResultsStoreBase<T extends TResultsObject> with Store {
  _ResultsStoreBase({bool autoFetch = true}) {
    fetchResultsFuture = _emptyResults;
    if (autoFetch) {
      fetchResults();
    }
  }

  final TmdbService tmdb = Modular.get<TmdbService>();

  @observable
  T results;

  @observable
  ObservableFuture<T> fetchResultsFuture;

  bool get _isLoaded =>
      fetchResultsFuture != _emptyResults && fetchResultsFuture.status == FutureStatus.fulfilled;

  bool get _isLoading =>
      fetchResultsFuture != _emptyResults && fetchResultsFuture.status == FutureStatus.pending;

  @computed
  bool get hasResults => (_isLoaded || _isLoading) && (results != null);

  int get resultsNextPageIndex => (results?.page ?? 0) + 1;

  @action
  Future<T> fetchResults() async {
    results = null;
    final future = fetchResultsInternal();
    fetchResultsFuture = ObservableFuture(future);

    return results = await future;
  }

  @action
  Future<T> fetchResultsNextPage() async {
    final future = fetchResultsInternal();
    fetchResultsFuture = ObservableFuture(future);

    return results = results.mergeResults(await future);
  }

  Future<T> fetchResultsInternal();

  final ObservableFuture<T> _emptyResults = ObservableFuture.value(null);
}
