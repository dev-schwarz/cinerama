import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../../material.dart';
import '../../../../stores/results/movie_resources_store.dart';
import '../../base/media_resources_screen_base.dart';

class MovieSimilarScreen extends MediaResourcesScreenBase<SimilarMovies> {
  const MovieSimilarScreen(
    MovieSimilarResourceStore store, {
    Key key,
  }) : super(store, key: key);

  @override
  IconData loadingIcon() => Icons.local_movies;

  @override
  String loadingTitle(BuildContext context) {
    // TODO: Add localizations here!
    return 'Similar for:';
  }

  @override
  String loadingMessage(BuildContext context) {
    // TODO: Add localizations here!
    return store.resumedMedia.title ?? '';
  }

  @override
  String pageTitle(BuildContext context) {
    // TODO: Add localizations here!
    return 'Similar Movies';
  }
}
