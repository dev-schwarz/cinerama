import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/tmdb_helper_mixin.dart';
import '../../../material.dart';
import '../../../stores/media/media_store.dart';
import '../base/media_helper_mixin.dart';
import '../base/media_sliver_delegate.dart';
import '../widgets/button_bar/button_bar.dart';
import '../widgets/popularity_indicator.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen(this.store, {Key key}) : super(key: key);

  final PersonStore store;

  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen>
    with MediaHelperMixin<Person, PersonScreen>, TmdbHelperMixin {
  String get _personAgeInfo {
    if (mediaDetails.birthday == null) return null;

    String info = formatDate(mediaDetails.birthday);
    if (mediaDetails.deathday == null)
      info += '  (${calculateAge(mediaDetails.birthday)}) years';
    else
      info += '  ─  ${formatDate(mediaDetails.deathday)}';

    return info;
  }

  Widget _biography() {
    if ((mediaDetails?.biography ?? '').isEmpty) return null;

    return CustomExpansionTile(
      contentPadding: const EdgeInsets.all(16.0),
      decoration: getCustomExpansionTileDecoration(context),
      title: context.i18n.screens.personDetails.biography,
      titleStyle: customExpansionTileTitleStyle,
      children: <Widget>[
        IndentedText(
          mediaDetails.biography,
          textAlign: TextAlign.justify,
          style: context.theme.textTheme.bodyText1,
        ),
      ],
    );
  }

  PopularitySentiment get _sentiment {
    if (mediaDetails.popularity >= 35) {
      return PopularitySentiment.verySatisfied;
    } else if (mediaDetails.popularity >= 25) {
      return PopularitySentiment.satisfied;
    } else if (mediaDetails.popularity >= 10) {
      return PopularitySentiment.neutral;
    } else if (mediaDetails.popularity >= 5) {
      return PopularitySentiment.dissatisfied;
    } else {
      return PopularitySentiment.veryDissatisfied;
    }
  }

  @override
  List<Widget> buildContents() {
    final items = <Widget>[];

    items.addAll([
      trailingTopPopularityIndicator(_sentiment),
      divider(),
      // [[ place of birth ]]
      info(
        '${context.i18n.screens.personDetails.placeOfBirth}:',
        mediaDetails.placeOfBirth,
        errorText: context.i18n.screens.personDetails.notAvailable,
      ),
    ]);

    items.addAll([
      divider(),
      // [[ biography ]]
      _biography(),
    ]);

    return items;
  }

  @override
  MediaButtonBar makeButtonBar() {
    return null;
  }

  @override
  MediaSliverDelegate makeHeaderDelegate() {
    return MediaSliverDelegate(
      resumedMedia: resumedMedia,
      title: resumedMedia.title,
      contents: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _personAgeInfo ?? '',
              textAlign: TextAlign.start,
              style: context.appTheme.mediaDetailsTheme.headerBottomTextStyle.copyWith(
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget makeTopLeadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${context.i18n.screens.personDetails.knownFor}:',
          style: context.theme.textTheme.headline6.copyWith(fontSize: 16.0),
        ),
        const SizedBox(height: 2.0),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            mediaDetails?.knownForDepartment ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  MediaStore<Person> get mediaStore => widget.store;
}
