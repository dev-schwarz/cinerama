part of 'settings_screen.dart';

class _SettingsRegionsScreen extends StatefulWidget {
  const _SettingsRegionsScreen({Key key}) : super(key: key);

  @override
  __SettingsRegionsScreenState createState() => __SettingsRegionsScreenState();
}

class __SettingsRegionsScreenState extends State<_SettingsRegionsScreen> {
  TmdbConfigurationRegion _selected;
  Future<Map<TmdbConfigurationRegion, String>> _values;

  @override
  void initState() {
    super.initState();
    _selected = TmdbConfig.region;
    _values = _loadValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings - Regions'),
      ),
      body: FutureBuilder<Map<TmdbConfigurationRegion, String>>(
        future: _values,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return const BigLoadingIndicator(
              iconData: Icons.location_on,
              title: 'Loading',
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

  Widget _makeRadioTile(MapEntry<TmdbConfigurationRegion, String> entry) {
    return RadioListTile(
      title: Text(entry.value),
      value: entry.key,
      groupValue: _selected,
      onChanged: (value) {
        setState(() {
          _selected = value;
        });
        TmdbConfig.region = value;
        _saveValue();
      },
    );
  }

  void _saveValue() {
    context.settingsStore.saveSettings();
  }

  Future<Map<TmdbConfigurationRegion, String>> _loadValues() async {
    final TmdbService tmdb = Modular.get<TmdbService>();

    final countries = (await tmdb.api.configuration.getCountries()).results;

    final Map<TmdbConfigurationRegion, String> result =
        Map<TmdbConfigurationRegion, String>.fromEntries(
      TmdbConfigurationRegion.values.map((item) {
        final country = countries.firstWhere((c) => c.iso_3166_1 == item.region).englishName;

        return MapEntry(item, country);
      }).toList(),
    );

    return result;
  }
}