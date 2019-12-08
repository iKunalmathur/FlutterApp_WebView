import 'package:flutterapp_webview/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SupportPageWeb extends StatefulWidget {
  final Function someFunction;
  SupportPageWeb(this.someFunction);

  @override
  _SupportPageWebState createState() => _SupportPageWebState(someFunction);
}

class _SupportPageWebState extends State<SupportPageWeb> {
  bool _isLoading = true;
final Function someFunction;
  _SupportPageWebState(this.someFunction);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            
            backgroundColor: Color.fromARGB(255, 246, 89, 53),
          )
        ),
        endDrawer:someFunction(),
        body: ProgressHUD(
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Stack(
              children: <Widget>[
                WebView(
                  initialUrl:"add your url",
                  javascriptMode: JavascriptMode.unrestricted,

                  onPageFinished: pageFinishedLoading,
                ),
              ],
            ),
          ),
          inAsyncCall: _isLoading,
          opacity: 0.0,
        ));
  }
  void pageFinishedLoading(String url) {
    setState(() {
      _isLoading = false;
    });
  }
} 
