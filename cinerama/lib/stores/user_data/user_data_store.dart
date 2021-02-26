import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../models/app_config.dart';
import '../../services/tmdb_service.dart';

part 'favorites_store.dart';
part 'lists_store.dart';
part 'user_data_store.g.dart';
part 'user_list_store.dart';
part 'watch_list_store.dart';

class UserDataStore = _UserDataStoreBase with _$UserDataStore;

abstract class _UserDataStoreBase with Store {
  final _FavoritesStore favoritesStore = _FavoritesStore();

  final _WatchListStore watchListStore = _WatchListStore();

  final _ListsStore listsStore = _ListsStore();

  _UserListStore userListStore;

  @observable
  bool isFetchingData = false;

  @observable
  bool isInitialized = false;

  @action
  void activateUserListStore(int listId) {
    userListStore = _UserListStore(listId);
  }

  @action
  void deactivateUserListStore() {
    userListStore = null;
  }

  @computed
  bool get userListStoreActive => userListStore != null;

  @action
  Future fetchAllData() async {
    isFetchingData = true;

    await favoritesStore.fetchFavoriteMovies();
    await favoritesStore.fetchFavoriteTvs();
    await watchListStore.fetchWatchListMovies();
    await watchListStore.fetchWatchListTvs();
    await listsStore.fetchUserLists();
    await listsStore.fetchAllListsDetails();

    isFetchingData = false;
    if (!isInitialized) {
      isInitialized = true;
    }
  }
}
