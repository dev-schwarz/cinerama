import '../../material.dart';

class TmdbLogo extends StatelessWidget {
  const TmdbLogo({Key key, this.child}) : super(key: key);

  final Widget child;

  static const Color _tmdbSecondaryColor = const Color(0xff01b4e4);
  static const Color _tmdbTertiaryColor = const Color(0xff90cea1);
  static const String _tmdbImageLogo = 'assets/images/primary-long-blue.png';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30.0),
              Icon(
                Icons.movie_filter_outlined,
                color: _tmdbSecondaryColor.withOpacity(0.5),
                size: 90.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Cinerama',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: _tmdbSecondaryColor,
                  fontSize: 36.0,
                  letterSpacing: 4.0,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      color: _tmdbTertiaryColor,
                      blurRadius: 20.0,
                    ),
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      color: _tmdbTertiaryColor,
                      blurRadius: 60.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60.0),
              child,
            ],
          ),
          // [[ "Powered By" water mark ]]
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
            child: Align(
              alignment: const Alignment(1.0, 1.0),
              child: Opacity(
                opacity: 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Powered by',
                        style: TextStyle(
                          color: _tmdbTertiaryColor,
                          fontSize: 16.0,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w300,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              color: _tmdbSecondaryColor,
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Image.asset(
                      _tmdbImageLogo,
                      width: MediaQuery.of(context).size.width / 2.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
