import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/app_constants.dart';
import '../../../material.dart';
import '../widgets/library_app_bar_title.dart';

class FavoriteTvsScreen extends StatelessWidget {
  const FavoriteTvsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.dataStore.favoritesStore;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppConstants.appAppBarTitleSpacing,
        centerTitle: true,
        title: Observer(
          builder: (_) {
            return LibraryAppBarTitle(
              title: context.i18n.screens.library.favoriteTvs,
              listSize: store.hasFavoriteTvs ? store.favoriteTvs.totalResults : 0,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.swap_vert,
              size: 20.0,
              color: Colors.yellowAccent,
            ),
            visualDensity: VisualDensity.compact,
            // tooltip: context.i18n.tmdb.sortOrderSwitch(store.favoriteTvsSortBy.order),
            tooltip: 'Favorite',
            onPressed: store.toggleFavoriteTvsSortBy,
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return !store.hasFavoriteTvs
              ? const BigLoadingIndicator(
                  iconData: Icons.refresh,
                  message: 'Loading',
                )
              : ResultsView<AccountFavoriteTvs>(
                  content: store.favoriteTvs,
                );
        },
      ),
    );
  }
}
