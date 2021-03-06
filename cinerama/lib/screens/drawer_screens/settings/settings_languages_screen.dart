part of 'settings_screen.dart';

class _SettingsLanguagesScreen extends StatefulWidget {
  const _SettingsLanguagesScreen({Key key}) : super(key: key);

  @override
  __SettingsLanguagesScreenState createState() => __SettingsLanguagesScreenState();
}

class __SettingsLanguagesScreenState extends State<_SettingsLanguagesScreen> {
  TmdbConfigurationLanguage _selected;
  Future<Map<TmdbConfigurationLanguage, String>> _values;

  @override
  void initState() {
    super.initState();
    _selected = TmdbConfig.language;
    _values = _loadValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i18n.screens.titles.settingsLanguages),
      ),
      body: FutureBuilder<Map<TmdbConfigurationLanguage, String>>(
        future: _values,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return BigLoadingIndicator(
              iconData: Icons.language,
              title: context.i18n.general.loading,
            );
          }

          final tiles = snapshot.data.entries.map((entry) => _makeRadioTile(entry)).toList();

          return SingleChildScrollView(
            child: Column(children: tiles),
          );
        },
      ),
    );
  }

  Widget _makeRadioTile(MapEntry<TmdbConfigurationLanguage, String> entry) {
    return RadioListTile<TmdbConfigurationLanguage>(
      title: Text(entry.value),
      value: entry.key,
      groupValue: _selected,
      onChanged: (value) {
        setState(() {
          _selected = value;
        });
        TmdbConfig.language = value;
        _saveValue();
      },
    );
  }

  void _saveValue() {
    context.settingsStore.saveSettings();
  }

  Future<Map<TmdbConfigurationLanguage, String>> _loadValues() async {
    final TmdbService tmdb = Modular.get<TmdbService>();

    final countries = (await tmdb.api.configuration.getCountries()).results;
    final languages = (await tmdb.api.configuration.getLanguages()).results;

    final Map<TmdbConfigurationLanguage, String> result =
        Map<TmdbConfigurationLanguage, String>.fromEntries(
      TmdbConfigurationLanguage.values.map((item) {
        final split = item.language.split('-');
        final language = languages.firstWhere((l) => l.iso_639_1 == split[0]).englishName;
        final country = countries.firstWhere((c) => c.iso_3166_1 == split[1]).englishName;

        return MapEntry(item, '$language ($country)');
      }).toList(),
    );

    return result;
  }
}
