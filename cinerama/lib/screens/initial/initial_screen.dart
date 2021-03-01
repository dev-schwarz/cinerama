import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../global/app_routes.dart';
import '../../material.dart';
import '../../stores/login/login_store.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (context.loginStore.loginStep == LoginStep.starting) {
          return const BigLoadingIndicator(
            iconData: null,
            showTitle: false,
          );
        } else if (context.loginStore.loginStep == LoginStep.userLogged) {
          return const _TmdbSplash();
        } else if (context.loginStore.loginStep == LoginStep.pending) {
          return TmdbLogo(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: ButtonTheme(
                  height: 36.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  ),
                  buttonColor: Colors.purple.shade700,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          Modular.to.pushReplacementNamed(AppRoutes.login);
                        },
                        elevation: 10.0,
                        child: const Text('Login on TMDb'),
                      ),
                      const SizedBox(height: 10.0),
                      RaisedButton(
                        onPressed: () {
                          context.loginStore.loginFakeUser(true);
                        },
                        elevation: 10.0,
                        color: Colors.red.shade800,
                        child: const Text('Temporary Fake Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: Icon(Icons.error),
          );
        }
      },
    );
  }
}

class _TmdbSplash extends StatefulWidget {
  const _TmdbSplash({Key key}) : super(key: key);

  @override
  __TmdbSplashState createState() => __TmdbSplashState();
}

class __TmdbSplashState extends State<_TmdbSplash>
    with SingleTickerProviderStateMixin<_TmdbSplash> {
  AnimationController _controller;
  ReactionDisposer _reactionDisposer;

  @override
  void initState() {
    super.initState();

    _reactionDisposer = when((_) => context.dataStore.isInitialized, () => _controller.reverse());

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _fadeAnimationDuration),
    )
      ..addListener(
        () => setState(() {}),
      )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          context.dataStore.fetchAllData();
        } else if (status == AnimationStatus.dismissed) {
          Modular.to.pushNamed(AppRoutes.home);
        }
      });

    Future.delayed(const Duration(milliseconds: _startAnimationDelay)).whenComplete(() {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final String userName = context.loginStore.hasUser ? context.loginStore?.user?.data?.name : '';

    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Opacity(
        opacity: Tween<double>(begin: 0.0, end: 1.0).evaluate(_controller),
        child: TmdbLogo(
          child: Column(
            children: [
              Text(
                'Welcome',
                style: context.theme.textTheme.subtitle2,
              ),
              const SizedBox(height: 10.0),
              Text(
                userName,
                style: context.theme.textTheme.subtitle1,
              ),
              const SizedBox(height: 10.0),
              const Opacity(
                opacity: 0.5,
                child: ColorLoaderIndicator(
                  radius: 30.0,
                  dotRadius: 10.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _reactionDisposer();
    _controller
      ..removeListener(() {})
      ..removeStatusListener((status) {})
      ..dispose();

    super.dispose();
  }

  static const int _startAnimationDelay = 1500;
  static const int _fadeAnimationDuration = 1000;
}
