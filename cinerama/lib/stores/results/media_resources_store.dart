import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/tmdb_resumed_media.dart';
import 'results_store.dart';

part 'media_resources_store.g.dart';

abstract class MediaResourcesStore<T extends TResultsObject> = _MediaResourcesStoreBase<T>
    with _$MediaResourcesStore;

abstract class _MediaResourcesStoreBase<T extends TResultsObject> extends ResultsStore<T>
    with Store {
  _MediaResourcesStoreBase(this.resumedMedia);

  final TmdbResumedMedia resumedMedia;
}
