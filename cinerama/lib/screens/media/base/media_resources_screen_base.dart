import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../material.dart';
import '../../../stores/results/media_resources_store.dart';

abstract class MediaResourcesScreenBase<T extends TResultsObject> extends StatelessWidget {
  const MediaResourcesScreenBase(this.store, {Key key}) : super(key: key);

  final MediaResourcesStore<T> store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle(context)),
      ),
      body: Observer(
        builder: (ctx) {
          if (!store.hasResults) {
            return BigLoadingIndicator(
              iconData: loadingIcon(),
              title: loadingTitle(context),
              message: loadingMessage(context),
              horizontal: false,
            );
          }

          return ResultsView<T>(
            content: store.results,
            handleRefresh: store.fetchResults,
            loadNextPage: store.fetchResultsNextPage,
          );
        },
      ),
    );
  }

  String pageTitle(BuildContext context);

  String loadingTitle(BuildContext context);

  String loadingMessage(BuildContext context);

  IconData loadingIcon();
}
