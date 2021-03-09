import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/app_routes.dart';
import '../../../global/tmdb_helper_mixin.dart';
import '../../../material.dart';
import '../../../stores/media/media_store.dart';
import '../base/media_helper_mixin.dart';
import '../base/media_sliver_delegate.dart';
import '../widgets/button_bar/button_bar.dart';

class TvSeasonScreen extends StatefulWidget {
  const TvSeasonScreen(this.store, {Key key}) : super(key: key);

  final TvSeasonStore store;

  @override
  _TvSeasonScreenState createState() => _TvSeasonScreenState();
}

class _TvSeasonScreenState extends State<TvSeasonScreen>
    with MediaHelperMixin<TvSeason, TvSeasonScreen>, TmdbHelperMixin {
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

  Widget _episodes() {
    final Color iconColor = Colors.black.withOpacity(0.38);

    return CustomExpansionTile(
      contentPadding: const EdgeInsets.all(16.0),
      decoration: getCustomExpansionTileDecoration(context),
      title: firstLetterUCase(context.i18n.screens.tvSeasonDetails.episodes),
      titleStyle: customExpansionTileTitleStyle,
      children: <Widget>[
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: mediaDetails.episodes.length,
          separatorBuilder: (_, __) => const SizedBox(height: 4.0),
          itemBuilder: (context, index) {
            final episode = mediaDetails.episodes[index];

            return InkWell(
              onTap: () {
                Modular.to.pushNamed(
                  AppRoutes.tvEpisodeDetails,
                  arguments: TvEpisodeScreenArgs(
                    tv: widget.store.tv,
                    tvSeason: mediaDetails,
                    episodeNumber: episode.episodeNumber,
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.chevron_right, color: iconColor, size: 22.0),
                  Expanded(
                    child: Text(
                      '${episode.episodeNumber.toString().padLeft(2, '0')} - ${episode.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTheme.mediaDetailsTheme.linkTextStyle,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  List<Widget> buildContents() {
    final items = <Widget>[];

    items.addAll([
      trailingTopEmpty(),
      divider(8.0),
      _overview(),
    ]);

    // [[ episodes ]]
    if (mediaDetails.episodes?.isNotEmpty ?? false) {
      items.addAll([
        spacer(),
        _episodes(),
      ]);
    }

    items.add(Container(
      height: 600,
    ));

    return items;
  }

  @override
  MediaButtonBar makeButtonBar() {
    // TODO: implement makeButtonBar
    throw UnimplementedError();
  }

  @override
  MediaSliverDelegate makeHeaderDelegate() {
    return MediaSliverDelegate(
      resumedMedia: resumedMedia,
      title: widget.store.tv.name,
      subtitle:
          '${context.i18n.screens.tvSeasonDetails.season} ${mediaDetails.seasonNumber.toString().padLeft(2, '0')}',
      contents: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              resumedMedia?.dateTime?.year?.toString() ?? '',
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '${context.i18n.screens.tvSeasonDetails.season}:',
              textAlign: TextAlign.end,
              style: context.theme.textTheme.bodyText1
                  .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                mediaDetails.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: context.theme.textTheme.bodyText1.copyWith(fontSize: 14.0),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              mediaDetails.episodes.length.toString().padLeft(2, '0'),
              style: context.theme.textTheme.bodyText1
                  .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4.0),
            Text(
              context.i18n.screens.tvSeasonDetails.episodes,
              style: context.theme.textTheme.bodyText1.copyWith(fontSize: 15.0),
            ),
          ],
        ),
      ],
    );
  }

  @override
  MediaStore<TvSeason> get mediaStore => widget.store;
}
