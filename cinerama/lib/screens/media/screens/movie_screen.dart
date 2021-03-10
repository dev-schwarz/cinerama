import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/app_constants.dart';
import '../../../global/app_utils.dart';
import '../../../global/navigation/app_navigation.dart';
import '../../../global/tmdb_helper_mixin.dart';
import '../../../material.dart';
import '../../../models/app_config.dart';
import '../../../stores/media/media_store.dart';
import '../../../widgets/tmdb/people_cards_grid.dart';
import '../base/media_helper_mixin.dart';
import '../base/media_sliver_delegate.dart';
import '../widgets/button_bar/button_bar.dart';
import '../widgets/button_bar/buttons.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen(this.store, {Key key}) : super(key: key);

  final MovieStore store;

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen>
    with MediaHelperMixin<Movie, MovieScreen>, TmdbHelperMixin {
  /// The overview of the movie.
  Widget _overview() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 0.0),
      child: IndentedText(
        mediaDetails.overview,
        textAlign: TextAlign.justify,
        style: context.theme.textTheme.bodyText1,
      ),
    );
  }

  /// An horizontal card grid with the cast of the movie.
  Widget _cast() {
    return PeopleCardsGrid(
      data: mediaDetails.credits.cast,
      cardDataBuilder: (Cast cast) => PersonCardData(
        id: cast.id,
        name: cast.name,
        details: cast.character,
        profilePath: cast.profilePath,
      ),
    );
  }

  /// An horizontal card grid with the crew of the movie.
  Widget _crew() {
    final crew = List<Crew>.from(mediaDetails.credits.crew)
      ..sort((a, b) {
        final valA = AppConstants.appPersonDepartmentOrder[a.department] ?? 0;
        final valB = AppConstants.appPersonDepartmentOrder[b.department] ?? 0;
        return valA >= valB ? -valA : valB;
      })
      ..toList();

    return PeopleCardsGrid(
      data: crew,
      cardDataBuilder: (Crew crew) => PersonCardData(
        id: crew.id,
        name: crew.name,
        details: crew.department,
        profilePath: crew.profilePath,
      ),
    );
  }

  Widget _recommendationsButton() {
    return FlatButton(
      textColor: Colors.blue,
      onPressed: () {
        Modular.to.pushNamed(
          AppRoutes.movieRecommendations,
          arguments: RecommendationsScreenArgs(resumedMedia: resumedMedia),
        );
      },
      child: Text(context.i18n.screens.movieDetails.btnRecommendations),
    );
  }

  String get _releaseDate {
    const typeValues = <int>[1, 3];

    final releaseDateRegion = mediaDetails?.releaseDates?.results?.firstWhere(
      (e) => e.iso_3166_1 == TmdbConfig.region.region,
      orElse: () => null,
    );

    // final releaseDateRegion = mediaDetails.releaseDates != null
    //     ? mediaDetails.releaseDates.results.firstWhere(
    //         (e) => e.iso_3166_1 == TmdbConfig.region.region,
    //         orElse: () => null,
    //       )
    //     : null;

    final releaseDates = releaseDateRegion?.releaseDates?.where((e) => typeValues.contains(e.type));

    final releaseDate = (releaseDates != null && releaseDates.isNotEmpty)
        ? (releaseDates.any((e) => e.type == typeValues.first)
                ? releaseDates?.firstWhere((e) => e.type == typeValues.first)
                : releaseDates.first)
            ?.releaseDate
        : resumedMedia?.dateTime;

    return releaseDate?.year?.toString() ?? '';
  }

  @override
  List<Widget> buildContents() {
    final items = <Widget>[];

    // vote average & action bar buttons
    items.addAll([
      trailingTopVoteAverage(mediaDetails.voteAverage),
      spacer(10.0),
      divider(8.0),
      makeButtonBar(),
      divider(8.0),
    ]);

    // [[ recommendations ]]
    items.add(
      _recommendationsButton(),
    );

    // [[ overview ]]
    items.add(
      _overview(),
    );

    // [[ genres ]]
    if (mediaDetails?.genres?.isNotEmpty ?? false) {
      items.addAll([
        spacer(),
        infoWidget(
          '${context.i18n.screens.movieDetails.genres}:',
          mediaDetails.genres.map((genre) => genre.name),
          separator: ', ',
        ),
      ]);
    }

    // [[ status ]]
    items.addAll([
      spacer(13.0),
      info('${context.i18n.screens.movieDetails.status}:', mediaDetails.mediaStatus.toString()),
    ]);

    // [[ budget ]]
    if (mediaDetails?.budget != 0 ?? false) {
      items.addAll([
        spacer(13.0),
        // info('Budget:', mediaDetails.budget.toString()),
        info('${context.i18n.screens.movieDetails.budget}:', formatCurrency(mediaDetails.budget)),
      ]);
    }

    // [[ revenue ]]
    if (mediaDetails?.revenue != 0 ?? false) {
      items.addAll([
        spacer(13.0),
        info('${context.i18n.screens.movieDetails.revenue}:', formatCurrency(mediaDetails.revenue)),
      ]);
    }

    // [[ cast ]]
    if (mediaDetails.credits != null && mediaDetails.credits.cast.isNotEmpty) {
      items.addAll([
        divider(),
        sectionTitle(context.i18n.screens.movieDetails.cast),
        _cast(),
      ]);
    }

    // [[ crew ]]
    if (mediaDetails.credits != null && mediaDetails.credits.crew.isNotEmpty) {
      items.addAll([
        divider(),
        sectionTitle(context.i18n.screens.movieDetails.crew),
        _crew(),
      ]);
    }

    return items;
  }

  @override
  MediaButtonBar makeButtonBar() {
    return MediaButtonBar(
      buttons: [
        MediaFavoriteButton(mediaStore: mediaStore),
        MediaWatchListButton(mediaStore: mediaStore),
        MediaRatingButton(mediaStore: mediaStore),
        MediaListButton(mediaStore: mediaStore),
      ],
    );
  }

  @override
  MediaSliverDelegate makeHeaderDelegate() {
    return MediaSliverDelegate(
      resumedMedia: resumedMedia,
      title: resumedMedia.title,
      contents: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _releaseDate,
              textAlign: TextAlign.end,
              style: context.appTheme.mediaDetailsTheme.headerBottomTextStyle,
            ),
            Text(
              AppUtils.convertIntToRuntime(mediaDetails.runtime),
              textAlign: TextAlign.end,
              style: context.appTheme.mediaDetailsTheme.headerBottomTextStyle,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget makeTopLeadingWidget() {
    return Text(
      mediaDetails.tagline,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: context.theme.textTheme.subtitle2.copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  MediaStore<Movie> get mediaStore => widget.store;
}
