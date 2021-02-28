import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../global/app_routes.dart';
import '../../material.dart';
import '../../stores/login/login_store.dart';

const double _hrPadding = 16.0;
const EdgeInsets _btnPadding = const EdgeInsets.symmetric(horizontal: 32.0 - _hrPadding);

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return const _Welcome();
  }
}

class _Welcome extends StatelessWidget {
  const _Welcome();

  @override
  Widget build(BuildContext context) {
    final btnStyle = context.theme.textTheme.button.copyWith(
      fontSize: 18.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Access your TMDb account'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(_hrPadding, 0.0, _hrPadding, 80.0),
        child: ButtonTheme(
          height: 36.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
          ),
          buttonColor: Colors.purple.shade700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Access to your TMDb account',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              const Divider(color: Colors.grey, thickness: 1.5),
              const SizedBox(height: 10.0),
              Text(
                'Cinemascope needs access to your TMDb account.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16.0),
              ),
              const SizedBox(height: 40.0),
              IndentedText(
                'We will redirect you to the TMDb site, where you need to grant permission '
                'to Cinemascope, so it will have access to your account data.',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 15.0),
              ),
              const SizedBox(height: 80.0),
              Padding(
                padding: _btnPadding,
                child: RaisedButton(
                  onPressed: () {
                    Modular.to.pushNamed(AppRoutes.tmdbAccess);
                  },
                  elevation: 10.0,
                  child: Text(
                    'Grant access from TMDb',
                    style: btnStyle,
                  ),
                ),
              ),
              Padding(
                padding: _btnPadding,
                child: RaisedButton(
                  onPressed: () {
                    Modular.get<LoginStore>().loginAndSaveFakeUser(true).whenComplete(() {
                      Modular.to.pushReplacementNamed(AppRoutes.initial);
                    });
                  },
                  elevation: 10.0,
                  color: Colors.red.shade800,
                  child: Text(
                    'Perform a fake login',
                    style: btnStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RequestPermission extends StatefulWidget {
  const _RequestPermission({
    Key key,
    @required this.requestPermUrl,
    @required this.permGrantedUrl,
    @required this.onPermGranted,
  }) : super(key: key);

  final String requestPermUrl;
  final String permGrantedUrl;
  final VoidCallback onPermGranted;

  @override
  __RequestPermissionState createState() => __RequestPermissionState();
}

class __RequestPermissionState extends State<_RequestPermission> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TMDb User Login'),
      ),
      body: Builder(
        builder: (ctx) {
          return WebView(
            initialUrl: widget.requestPermUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              _controller.complete();
            },
            navigationDelegate: (request) {
              if (request.url.startsWith(widget.permGrantedUrl)) {
                debugPrint('[_RequestPermission] : onPermGranted');
                log('[_RequestPermission] : onPermGranted');
                widget.onPermGranted();
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
    @required this.onCompletePressed,
  }) : super(key: key);

  final VoidCallback onCompletePressed;

  @override
  Widget build(BuildContext context) {
    final btnStyle = context.theme.textTheme.button.copyWith(
      fontSize: 18.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('TMDb User Login Account'),
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
              style: context.theme.textTheme.headline5,
            ),
            const Divider(color: Colors.grey, thickness: 1.5),
            const SizedBox(height: 10.0),
            Text(
              'You have been granted access to your TMDb account',
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyText1.copyWith(fontSize: 16.0),
            ),
            const SizedBox(height: 80.0),
            Padding(
              padding: _btnPadding,
              child: RaisedButton(
                onPressed: onCompletePressed,
                child: Text('START', style: btnStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
