import 'package:cloudy24_webview/contact_web.dart';
import 'package:cloudy24_webview/login_web.dart';
import 'package:cloudy24_webview/about_web.dart';
import 'package:cloudy24_webview/progress_hud.dart';
import 'package:cloudy24_webview/support_web.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'dart:async';



void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      title: "Cloudy 24",
      color: Color.fromARGB(255, 246, 87, 53),
      darkTheme: ThemeData(
        brightness: Brightness.dark, 
      ),
      home: Cloudy24Home(),  
      debugShowCheckedModeBanner: false,
    );
  }
}
class Someclass{}
class Cloudy24Home extends StatefulWidget {
  @override
  _Cloudy24HomeState createState() => _Cloudy24HomeState();
}

class _Cloudy24HomeState extends State<Cloudy24Home>{
bool _isLoading = true;
someFunction(){
  return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
           Container(
             height: 180,
             child: DrawerHeader(
                child: Text('Client',style: TextStyle(color: Colors.white),),
                decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 89, 53),
              )
             ),
           ),
          /* RaisedButton(
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
           shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.red)),
            onPressed: (){
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage()
              ));
            },
            child: Text("Login",style: TextStyle(color: Color.fromARGB(255, 246, 57, 53),fontSize: 18),),
            //color: Color.fromARGB(255, 246, 57, 53),
            color: Colors.white,
            splashColor: Colors.white,
          ),*/
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Cloudy24Home()
                ));
              },
              leading: Icon(Icons.home,size: 44,color: Color.fromARGB(255, 246, 89, 53),),
              title: Text("Home",style:TextStyle(color:Color.fromARGB(255, 246, 89, 53),fontSize: 18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginPageWeb(someFunction)
                ));
              },
              leading: Icon(Icons.supervised_user_circle,size: 44,color: Color.fromARGB(255, 246, 89, 53),),
              title: Text("Login",style:TextStyle(color:Color.fromARGB(255, 246, 89, 53),fontSize: 18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
              builder: (context) => SupportPageWeb(someFunction)
                ));
              },
              leading: Icon(Icons.settings,size: 44,color: Color.fromARGB(255, 246, 89, 53),),
              title: Text("Support",style:TextStyle(color:Color.fromARGB(255, 246, 89, 53),fontSize: 18)),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ContactPageWeb(someFunction)
                ));
              },
              leading: Icon(Icons.mail,size: 44,color: Color.fromARGB(255, 246, 89, 53),),
              title: Text("Contact",style:TextStyle(color:Color.fromARGB(255, 246, 89, 53),fontSize: 18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  //builder: (context) => ContactPageWeb()
                ));
              },
              leading: Icon(Icons.chat,size: 44,color: Color.fromARGB(255, 246, 89, 53),),
              title: Text("Live Chat",style:TextStyle(color:Color.fromARGB(255, 246, 89, 53),fontSize: 18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AboutPageWeb(someFunction)
                ));
              },
              leading: Icon(Icons.info,size: 44,color: Color.fromARGB(255, 246, 89, 53),),
              title: Text("About",style:TextStyle(color:Color.fromARGB(255, 246, 89, 53),fontSize: 18)),
            ),
          )
          ],
        ),
      );
} 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            
            backgroundColor: Color.fromARGB(255, 246, 89, 53),
          )
        ),
      drawerScrimColor: Colors.white30,
      endDrawer: someFunction(),
      body: ProgressHUD(
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Stack(
              children: <Widget>[
                WebView(
                  initialUrl:"https://cloudy24.com/",
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