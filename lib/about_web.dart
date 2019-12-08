import 'package:cloudy24_webview/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class AboutPageWeb extends StatefulWidget {
  final Function someFunction;
  AboutPageWeb(this.someFunction);
  @override
  _AboutPageWebState createState() => _AboutPageWebState(someFunction);
}

class _AboutPageWebState extends State<AboutPageWeb> {
  final Function someFunction;
  _AboutPageWebState(this.someFunction);
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
       endDrawer:someFunction(),
        //endDrawer:Drawer(),
                        body: ProgressHUD(
                          child: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Stack(
                              children: <Widget>[
                                WebView(
                                  initialUrl:"https://cloudy24.com/about",
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
          