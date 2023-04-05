import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SafeWebView extends StatelessWidget {
  final String? url;
  SafeWebView({this.url, String? initialUrl});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeWebView(
        initialUrl: url,
      ),
    );
  }
}
