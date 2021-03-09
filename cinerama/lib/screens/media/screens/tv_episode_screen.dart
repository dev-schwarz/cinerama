import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/tmdb_helper_mixin.dart';
import '../../../material.dart';
import '../../../stores/media/media_store.dart';
import '../base/media_helper_mixin.dart';
import '../base/media_sliver_delegate.dart';
import '../widgets/button_bar/button_bar.dart';

class TvEpisodeScreen extends StatefulWidget {
  const TvEpisodeScreen(this.store, {Key key}) : super(key: key);

  final TvEpisodeStore store;

  @override
  _TvEpisodeScreenState createState() => _TvEpisodeScreenState();
}

class _TvEpisodeScreenState extends State<TvEpisodeScreen>
    with MediaHelperMixin<TvEpisode, TvEpisodeScreen>, TmdbHelperMixin {
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

  Widget _guestStars() {
    final TextStyle textStyle = context.theme.textTheme.bodyText2.copyWith(
      color: Colors.blue,
      decoration: TextDecoration.underline,
    );
    final Color iconColor = Colors.black.withOpacity(0.38);

    return CustomExpansionTile(
      contentPadding: const EdgeInsets.all(16.0),
      decoration: getCustomExpansionTileDecoration(context),
      titleStyle: customExpansionTileTitleStyle,
      title: context.i18n.screens.tvEpisodeDetails.guestStars,
      children: <Widget>[
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: mediaDetails.guestStars.length,
          separatorBuilder: (context, index) => const SizedBox(height: 4.0),
          itemBuilder: (context, index) {
            final TvGuestStar guestStar = mediaDetails.guestStars.elementAt(index);

            return InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => PersonScreen(guestStar.id),
                // ));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.chevron_right, color: iconColor, size: 22.0),
                  Expanded(
                    child: Text(
                      guestStar.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle,
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
      trailingTopVoteAverage(mediaDetails.voteAverage),
      // spacer(),
      divider(8.0),
      _overview(),
    ]);

    // [[ guest stars ]]
    if (mediaDetails.guestStars?.isNotEmpty ?? false) {
      items.addAll([
        spacer(),
        _guestStars(),
      ]);
    }

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
          '${context.i18n.screens.tvEpisodeDetails.season}: ${widget.store.tvSeason.seasonNumber.toString().padLeft(2, '0')} - '
          '${context.i18n.screens.tvEpisodeDetails.episode}: ${mediaDetails.episodeNumber.toString().padLeft(2, '0')}',
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
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('${context.i18n.screens.tvEpisodeDetails.season}:',
                  style: context.theme.textTheme.subtitle2),
              Text('${context.i18n.screens.tvEpisodeDetails.episode}:',
                  style: context.theme.textTheme.subtitle2),
            ],
          ),
        ),
        const SizedBox(width: 4.0),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.store.tvSeason.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.theme.textTheme.bodyText1,
              ),
              Text(
                mediaDetails.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.theme.textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  MediaStore<TvEpisode> get mediaStore => widget.store;
}
