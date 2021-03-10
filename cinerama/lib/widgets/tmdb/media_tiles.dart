import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../global/app_constants.dart';
import '../../global/navigation/app_navigation.dart';
import '../../global/tmdb_helper_mixin.dart';
import '../../material.dart';
import '../../models/app_config.dart';
import '../../models/tmdb_resumed_media.dart';

class MovieListTile extends _MediaListTileBase {
  MovieListTile(this.movieResumed, {Key key})
      : super(
          key,
          TmdbResumedMedia(
            id: movieResumed.id,
            title: movieResumed.title,
            description: movieResumed.overview,
            dateTime: movieResumed.releaseDate,
            imageUrl: TmdbConfig.makePosterUrl(movieResumed.posterPath),
            mediaType: movieResumed.mediaType,
          ),
        );

  final MovieResumed movieResumed;

  @override
  openMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.movieDetails,
      arguments: resumedMedia.id,
    );
  }
}

class TvListTile extends _MediaListTileBase {
  TvListTile(this.tvResumed, {Key key})
      : super(
          key,
          TmdbResumedMedia(
            id: tvResumed.id,
            title: tvResumed.name,
            description: tvResumed.overview,
            dateTime: tvResumed.firstAirDate,
            imageUrl: TmdbConfig.makePosterUrl(tvResumed.posterPath),
            mediaType: tvResumed.mediaType,
          ),
        );

  final TvResumed tvResumed;

  @override
  openMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.tvDetails,
      arguments: resumedMedia.id,
    );
  }
}

class PersonListTile extends _MediaListTileBase {
  PersonListTile(this.personResumed, {Key key})
      : super(
          key,
          TmdbResumedMedia(
            id: personResumed.id,
            title: personResumed.name,
            description: personResumed.gender.toString(),
            imageUrl: TmdbConfig.makeProfileUrl(personResumed.profilePath),
            mediaType: personResumed.mediaType,
          ),
        );

  final PersonResumed personResumed;

  @override
  openMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.personDetails,
      arguments: resumedMedia.id,
    );
  }
}

class MovieGridTile extends _MediaGridTileBase {
  MovieGridTile(this.movieResumed, {Key key})
      : super(
          key,
          TmdbResumedMedia(
            id: movieResumed.id,
            title: movieResumed.title,
            description: movieResumed.overview,
            dateTime: movieResumed.releaseDate,
            imageUrl: TmdbConfig.makePosterUrl(movieResumed.posterPath),
            mediaType: movieResumed.mediaType,
          ),
        );

  final MovieResumed movieResumed;

  @override
  openMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.movieDetails,
      arguments: resumedMedia.id,
    );
  }
}

class TvGridTile extends _MediaGridTileBase {
  TvGridTile(this.tvResumed, {Key key})
      : super(
          key,
          TmdbResumedMedia(
            id: tvResumed.id,
            title: tvResumed.name,
            description: tvResumed.overview,
            dateTime: tvResumed.firstAirDate,
            imageUrl: TmdbConfig.makePosterUrl(tvResumed.posterPath),
            mediaType: tvResumed.mediaType,
          ),
        );

  final TvResumed tvResumed;

  @override
  openMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.tvDetails,
      arguments: resumedMedia.id,
    );
  }
}

class PersonGridTile extends _MediaGridTileBase {
  PersonGridTile(this.personResumed, {Key key})
      : super(
          key,
          TmdbResumedMedia(
            id: personResumed.id,
            title: personResumed.name,
            description: personResumed.gender.toString(),
            imageUrl: TmdbConfig.makeProfileUrl(personResumed.profilePath),
            mediaType: personResumed.mediaType,
          ),
        );

  final PersonResumed personResumed;

  @override
  openMediaDetails(BuildContext context) {
    Modular.to.pushNamed(
      AppRoutes.personDetails,
      arguments: resumedMedia.id,
    );
  }
}

abstract class _MediaListTileBase extends _MediaTileBase {
  const _MediaListTileBase(
    Key key,
    TmdbResumedMedia resumedMedia,
  ) : super(key, resumedMedia);

  @override
  Widget build(BuildContext context) {
    final mediaIcon = getMediaTypeIcon(resumedMedia.mediaType);

    // TODO: Refatorar sem usar Row.
    final bottomRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          resumedMedia?.dateTime?.year?.toString() ?? '',
          style: context.appTheme.mediaTileTheme.bottomTextStyle,
        ),
        const SizedBox(width: 16.0),
      ],
    );

    final leftColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // [[ title ]]
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              mediaIcon,
              size: 18.0,
              color: context.appTheme.mediaTileTheme.mediaIconColor,
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: Text(
                resumedMedia.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.appTheme.mediaTileTheme.titleTextStyle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: IndentedText(
            resumedMedia.description,
            textAlign: TextAlign.justify,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: context.appTheme.mediaTileTheme.descriptionTextStyle,
          ),
        ),
        bottomRow,
        const SizedBox(height: 6.0),
      ],
    );

    final poster = AspectRatio(
      aspectRatio: AppConstants.tmdbPosterAspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: context.appTheme.mediaTileTheme.posterBackgroundColor,
          image: resumedMedia.imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(resumedMedia.imageUrl),
                  fit: BoxFit.fill,
                )
              : null,
        ),
        child: resumedMedia.imageUrl != null
            ? null
            : Icon(
                mediaIcon,
                size: AppConstants.appAlternativeMediaIconSize,
              ),
      ),
    );

    return Card(
      margin: const EdgeInsets.fromLTRB(10.0, 6.0, 4.0, 6.0),
      color: context.theme.scaffoldBackgroundColor,
      child: InkWell(
        onTap: () => openMediaDetails(context),
        child: Row(
          children: [
            Expanded(child: leftColumn),
            const SizedBox(width: 18.0),
            poster,
          ],
        ),
      ),
    );
  }
}

abstract class _MediaGridTileBase extends _MediaTileBase {
  const _MediaGridTileBase(
    Key key,
    TmdbResumedMedia resumedMedia,
  ) : super(key, resumedMedia);

  @override
  Widget build(BuildContext context) {
    final bool hasImageUrl = resumedMedia.imageUrl != null;

    final inkWellWidget = InkWell(
      onTap: () => openMediaDetails(context),
      onLongPress: () => super.showMediaInfoBar(context),
      child: hasImageUrl
          ? null
          : Icon(
              getMediaTypeIcon(resumedMedia.mediaType),
              size: AppConstants.appAlternativeMediaIconSize,
            ),
    );

    final inkWidget = hasImageUrl
        ? Ink.image(
            image: NetworkImage(resumedMedia.imageUrl),
            alignment: Alignment.center,
            fit: BoxFit.fill,
            child: inkWellWidget,
          )
        : Ink(
            child: InkWell(
              onTap: openMediaDetails(context),
              onLongPress: () => super.showMediaInfoBar(context),
              child: inkWellWidget,
            ),
          );

    return Material(
      color: Colors.grey,
      child: inkWidget,
    );
  }
}

abstract class _MediaTileBase extends StatelessWidget with TmdbHelperMixin {
  const _MediaTileBase(Key key, this.resumedMedia)
      : assert(resumedMedia != null, 'resumedMedia must not be null'),
        super(key: key);

  final TmdbResumedMedia resumedMedia;

  void showMediaInfoBar(BuildContext context) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(getMediaTypeIcon(resumedMedia.mediaType)),
              const SizedBox(width: 10.0),
              Text(
                resumedMedia.title,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headline6.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
            ],
          ),
          duration: const Duration(milliseconds: 1500),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          backgroundColor: context.theme.accentColor,
        ),
      );
  }

  openMediaDetails(BuildContext context);
}
