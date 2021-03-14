import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../../material.dart';
import '../../../../stores/results/movie_resources_store.dart';
import '../../base/media_resources_screen_base.dart';

class MovieRecommendationsScreen extends MediaResourcesScreenBase<MovieRecommendations> {
  const MovieRecommendationsScreen(
    MovieRecommendationsResourceStore store, {
    Key key,
  }) : super(store, key: key);

  @override
  IconData loadingIcon() => Icons.local_movies;

  @override
  String loadingMessage(BuildContext context) {
    // TODO: Add localizations here!
    return store.resumedMedia.title ?? '';
  }

  @override
  String loadingTitle(BuildContext context) {
    // TODO: Add localizations here!
    return 'Recommendations for:';
  }

  @override
  String pageTitle(BuildContext context) {
    // TODO: Add localizations here!
    return 'Movie Recommendations';
  }
}
