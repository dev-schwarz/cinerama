import 'dart:async';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../global/navigation/app_navigation.dart';
import '../../../material.dart';
import '../../../stores/login/login_store.dart';
import '../../../stores/login/tmdb_access_store.dart';

const _hrPadding = 16.0;
const _buttonPadding = const EdgeInsets.symmetric(horizontal: 32.0 - _hrPadding);

class TmdbAccessScreen extends StatelessWidget {
  const TmdbAccessScreen();

  @override
  Widget build(BuildContext context) {
    final TmdbAccessStore store = Modular.get<TmdbAccessStore>();

    return Observer(
      builder: (_) {
        switch (store.step) {
          case TmdbAccessStep.initial:
          case TmdbAccessStep.creatingRequestToken:
            return const BigIconMessage(
              iconData: Icons.settings_applications,
              message: 'Configuring',
            );
          // return const BigLoadingIndicator(
          //   iconData: null,
          //   message: 'Configuring',
          // );
          case TmdbAccessStep.requestingUserPermission:
            return _RequestPermission(
              requestPermissionUrl: store.permissionData.requestPermissionUrl,
              permissionGrantedUrl: store.permissionData.permissionGrantedUrl,
              onPermissionGranted: () {
                store.createAccessToken();
              },
            );
          case TmdbAccessStep.creatingAccessToken:
            return const BigIconMessage(
              iconData: Icons.settings_applications,
              message: 'Access Token',
            );
          // return const BigLoadingIndicator(
          //   iconData: null,
          //   title: 'Configuring',
          //   message: 'Access Token',
          // );
          case TmdbAccessStep.creatingSessionId:
            return const BigIconMessage(
              iconData: Icons.settings_applications,
              message: 'Session Id',
            );
          // return const BigLoadingIndicator(
          //   iconData: null,
          //   title: 'Configuring',
          //   message: 'Session ID',
          // );
          case TmdbAccessStep.completed:
            return _PermissionGranted(onPressed: () {
              Modular.get<LoginStore>().retryLoginCurrentUser().whenComplete(() {
                Modular.to.pushReplacementNamed(AppRoutes.initial);
              });
            });
          case TmdbAccessStep.error:
            return const BigIconMessage(
              iconData: Icons.settings_applications,
              message: 'E R R O R',
            );
          // return BigLoadingIndicator(
          //   iconData: Icons.error,
          //   color: Colors.red.shade800,
          //   message: 'E R R O R',
          // );
          default:
            return Container();
        }
      },
    );
  }
}

class _RequestPermission extends StatefulWidget {
  const _RequestPermission({
    Key key,
    @required this.requestPermissionUrl,
    @required this.permissionGrantedUrl,
    @required this.onPermissionGranted,
  }) : super(key: key);

  final String requestPermissionUrl;
  final String permissionGrantedUrl;
  final VoidCallback onPermissionGranted;

  @override
  __RequestPermissionState createState() => __RequestPermissionState();
}

class __RequestPermissionState extends State<_RequestPermission> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDb User Login'),
      ),
      body: Builder(
        builder: (ctx) {
          return WebView(
            initialUrl: widget.requestPermissionUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              _controller.complete();
            },
            navigationDelegate: (request) {
              if (request.url.startsWith(widget.permissionGrantedUrl)) {
                debugPrint('[_RequestPermission] : onPermissionGranted');
                widget.onPermissionGranted();
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          );
        },
      ),
    );
  }
}

class _PermissionGranted extends StatelessWidget {
  const _PermissionGranted({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context).textTheme.button.copyWith(
          fontSize: 18.0,
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Access to your TMDb account'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(_hrPadding, 0.0, _hrPadding, 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Access to your TMDb account granted',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(color: Colors.grey, thickness: 1.5),
            const SizedBox(height: 10.0),
            Text(
              'You have been granted access to your TMDb account',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16.0),
            ),
            const SizedBox(height: 80.0),
            Padding(
              padding: _buttonPadding,
              child: RaisedButton(
                onPressed: onPressed,
                child: Text('START', style: buttonTextStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
