import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../../material.dart';
import '../../../../stores/results/tv_resources_store.dart';
import '../../base/media_resources_screen_base.dart';

class TvSimilarScreen extends MediaResourcesScreenBase<SimilarTvs> {
  const TvSimilarScreen(
    TvSimilarResourceStore store, {
    Key key,
  }) : super(store, key: key);

  @override
  IconData loadingIcon() => Icons.live_tv;

  @override
  String loadingMessage(BuildContext context) {
    return store.resumedMedia.title ?? '';
  }

  @override
  String loadingTitle(BuildContext context) {
    return 'Similar for:';
  }

  @override
  String pageTitle(BuildContext context) {
    return 'Similar Tv';
  }
}
