import 'package:flutter_modular/flutter_modular.dart';

import '../../../global/app_utils.dart';
import '../../../material.dart';
import '../../../models/app_config.dart';
import '../../../services/tmdb_service.dart';

part 'settings_languages_screen.dart';
part 'settings_regions_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<Widget> _options;
  bool _includeAdult;
  bool _imageHighQuality;
  ResultsViewType _resultsViewType;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _resultsViewType = AppConfig.resultsViewType;
    _includeAdult = TmdbConfig.includeAdult;
    _imageHighQuality = TmdbConfig.posterSize != PosterSize.w92;

    final List<_OptionItemData> optionsItems = [
      _OptionItemData(
        title: context.i18n.screens.settings.language,
        iconData: Icons.language,
        child: const _SettingsLanguagesScreen(),
      ),
      _OptionItemData(
        title: context.i18n.screens.settings.region,
        iconData: Icons.location_on,
        child: const _SettingsRegionsScreen(),
      ),
    ];

    _options = optionsItems
        .map((option) => ListTile(
              contentPadding: _tilePadding,
              title: Text(option.title),
              leading: option.iconData != null ? Icon(option.iconData) : _iconBox,
              onTap: () {
                Modular.to.push(MaterialPageRoute(
                  builder: (_) => option.child,
                ));
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final children = ListUtils.intersperse<Widget>(
      const Divider(height: 1.0),
      _makeItems(),
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.i18n.screens.titles.settings),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: children.length,
        itemBuilder: (_, index) => children[index],
      ),
    );
  }

  List<Widget> _makeItems() {
    return <Widget>[
      ..._options,
      LabeledSwitch(
        label: context.i18n.screens.settings.includeAdult,
        value: _includeAdult,
        onChanged: (value) {
          setState(() {
            _includeAdult = value;
          });
          TmdbConfig.includeAdult = value;
          _saveSettings();
        },
      ),
      LabeledSwitch(
        label: context.i18n.screens.settings.imageHighQuality,
        value: _imageHighQuality,
        onChanged: (value) {
          setState(() {
            _imageHighQuality = value;
          });
          TmdbConfig.posterSize = value ? PosterSize.w185 : PosterSize.w92;
          TmdbConfig.profileSize = value ? ProfileSize.w185 : ProfileSize.w45;
          // context.settingsStore.saveSettings();
          _saveSettings();
        },
      ),
      _resultsViewTypeWidget(),
    ];
  }

  Widget _resultsViewTypeWidget() {
    final List<String> values = [
      context.i18n.screens.settings.list,
      context.i18n.screens.settings.grid,
    ];

    return LabeledDropdown<ResultsViewType>(
      value: _resultsViewType,
      label: context.i18n.screens.settings.viewMode,
      items: <ResultsViewType>[ResultsViewType.list, ResultsViewType.grid].toList(),
      itemBuilder: (item) => values[item.index],
      onChanged: (value) {
        setState(() {
          _resultsViewType = value;
        });
        AppConfig.resultsViewType = value;
        _saveSettings();
      },
    );
  }

  void _saveSettings() {
    context.settingsStore.saveSettings();
  }

  static const _iconBox = const SizedBox(width: 24.0, height: 24.0);
  static const _tilePadding = const EdgeInsets.all(16.0);
}

@immutable
class _OptionItemData {
  const _OptionItemData({
    @required this.title,
    @required this.child,
    this.iconData,
  });

  final String title;
  final Widget child;
  final IconData iconData;
}
