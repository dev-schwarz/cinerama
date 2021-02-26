import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../global/app_routes.dart';
import '../../material.dart';
import '../../stores/login/login_store.dart';

part 'logo.dart';
part 'splash.dart';

class _InitialWidgetsConstants {
  const _InitialWidgetsConstants._();

  static const secondaryColor = const Color(0xff01b4e4);
  static const tertiaryColor = const Color(0xff90cea1);

  static const secondaryOpacity = 0.5;
}

class InitialScreen extends StatelessWidget {
  const InitialScreen();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        print(context.loginStore.loginStep);
        if (context.loginStore.loginStep == LoginStep.starting) {
          return const BigLoadingIndicator(
            iconData: null,
            showTitle: false,
          );
        } else if (context.loginStore.loginStep == LoginStep.userLogged) {
          return const _Splash();
        } else if (context.loginStore.loginStep == LoginStep.pending) {
          return _Logo(
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
                        onPressed: context.loginStore.loginFakeUser,
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

  // @override
  // Widget build(BuildContext context) {
  //   return Observer(
  //     builder: (_) {
  //       if (context.loginStore.hasUser) {
  //         return const _Splash();
  //       } else {
  //         return _Logo(
  //           child: Align(
  //             alignment: Alignment.center,
  //             child: SizedBox(
  //               width: MediaQuery.of(context).size.width * 0.75,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.stretch,
  //                 children: [
  //                   RaisedButton(
  //                     onPressed: context.loginStore.loginFakeUser,
  //                     child: const Text('Fake Login'),
  //                   ),
  //                   RaisedButton(
  //                     onPressed: () {
  //                       Modular.to.pushReplacementNamed(AppRoutes.login);
  //                     },
  //                     elevation: 10.0,
  //                     child: const Text('Login on TMDb'),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }
}
