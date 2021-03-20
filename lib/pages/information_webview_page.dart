import 'package:flutter/material.dart';
import 'package:nineteen_trackers/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InformationWebviewPage extends StatefulWidget {
  String title, url;
  InformationWebviewPage({Key key, this.title, this.url}) : super(key: key);

  @override
  _InformationWebviewPageState createState() => _InformationWebviewPageState();
}

class _InformationWebviewPageState extends State<InformationWebviewPage> {
  // String title, url;
  bool isLoading = true;
  final _key = UniqueKey();

  // InformationWebviewPage(String title, String url) {
  //   this.title = title;
  //   this.url = url;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            WebView(
              key: _key,
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  )
                : Stack(),
          ],
        ));
  }
}
