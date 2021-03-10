import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../../../global/app_constants.dart';
import '../../../global/navigation/app_navigation.dart';
import '../../../global/tmdb_helper_mixin.dart';
import '../../../material.dart';
import '../../../models/app_config.dart';

class LibrarySectionLists extends StatelessWidget {
  const LibrarySectionLists({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listsStore = context.dataStore.listsStore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            context.i18n.screens.library.myLists,
            style: context.theme.textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: 10.0),
        Observer(
          builder: (_) {
            if (!listsStore.hasUserLists) {
              return const CircularProgressIndicator();
            }

            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: AppConstants.appListViewPadding,
              itemCount: listsStore.userLists.totalResults,
              itemBuilder: (ctx, index) {
                return _ListTile(list: listsStore.userLists.results[index]);
              },
            );
          },
        ),
      ],
    );
  }
}

class _ListTile extends StatelessWidget with TmdbHelperMixin {
  const _ListTile({
    Key key,
    @required this.list,
  })  : assert(list != null, 'list must not be null'),
        super(key: key);

  final Account4ListsItem list;

  @override
  Widget build(BuildContext context) {
    final leftColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          list.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.appTheme.mediaTileTheme.titleTextStyle,
        ),
        const SizedBox(height: 8.0),
        _textRow(
          context,
          '${context.i18n.screens.library.createdAt}:',
          '${formatDate(list.createdAt)}',
        ),
        _textRow(
          context,
          '${context.i18n.screens.library.updatedAt}:',
          '${formatDate(list.updatedAt)}',
        ),
      ],
    );

    return Container(
      height: 80.0,
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed(
            AppRoutes.libraryUserList,
            arguments: list,
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 6.0, 4.0, 6.0),
          child: Row(
            children: [
              Expanded(child: leftColumn),
              const SizedBox(width: 18.0),
              _ListPoster(
                imageUrl: TmdbConfig.makeBackdropUrl(list.backdropPath),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textRow(BuildContext context, String label, String text) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            label,
            textAlign: TextAlign.end,
            style: context.appTheme.mediaTileTheme.descriptionTextStyle,
          ),
        ),
        const SizedBox(width: 4.0),
        Expanded(
          flex: 5,
          child: Text(
            text,
            style: context.appTheme.mediaTileTheme.descriptionTextStyle,
          ),
        ),
      ],
    );
  }
}

class _ListPoster extends StatelessWidget {
  const _ListPoster({
    Key key,
    this.imageUrl,
    this.alternativeIcon = Icons.view_list,
  }) : super(key: key);

  final String imageUrl;
  final IconData alternativeIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: AspectRatio(
        aspectRatio: AppConstants.tmdbBackdropAspectRatio,
        child: Container(
          decoration: BoxDecoration(
            color: context.appTheme.mediaTileTheme.posterBackgroundColor,
            image: imageUrl != null
                ? DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: imageUrl == null
              ? Icon(
                  alternativeIcon,
                  size: AppConstants.appAlternativeMediaIconSize,
                )
              : null,
        ),
      ),
    );
  }
}
