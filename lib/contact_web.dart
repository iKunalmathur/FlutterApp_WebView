import 'package:flutterapp_webview/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactPageWeb extends StatefulWidget {
  final Function someFunction;
  ContactPageWeb(this.someFunction);

  @override
  _ContactPageWebState createState() => _ContactPageWebState(someFunction);
}

class _ContactPageWebState extends State<ContactPageWeb> {
  final Function someFunction;
  _ContactPageWebState(this.someFunction);
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            
            backgroundColor: Color.fromARGB(255, 246, 89, 53),
          )
        ),
        endDrawer: someFunction(),
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
