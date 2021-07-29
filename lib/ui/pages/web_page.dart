import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final bool showTitleBar;
  final String url;

  WebViewPage(this.url, {Key key, this.showTitleBar}) : super(key: key);

  @override
  WebViewState createState() => WebViewState();
}

class WebViewState extends State<WebViewPage> with AutomaticKeepAliveClientMixin<WebViewPage>{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (_) {
          setState(() {});
        },
        javascriptChannels: Set.from([
          JavascriptChannel(
              name: 'Print',
              onMessageReceived: (JavascriptMessage message) {
                ///print("FFFFFF");
                print(message.message);
              })
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
