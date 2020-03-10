import 'package:demo/pdf_reader.dart';
import 'package:demo/profile1.dart';
import 'package:flutter/material.dart';

import 'animation.dart';
import 'nextpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blueGrey),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/next': (context) => NextPage(),
        '/animation': (context) => AnimationPage(),
        '/profile1': (_) => ProfilePage(),
        '/pdf': (_) => PdfReaderDemo(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Heading"),
              decoration: BoxDecoration(color: Colors.grey),
            ),
            ListTile(
              title: Text("Profiles UIS"),
              onTap: () {
                Navigator.pushNamed(context, '/profile1');
              },
            ),
            ListTile(
              title: Text("Animation Twins"),
              onTap: () {
                Navigator.pushNamed(context, '/animation');
              },
            ),
            Divider(),
            ListTile(
              title: Text("Pdf Reader"),
              onTap: () {
                Navigator.pushNamed(context, '/pdf');
              },
            ),
            ListTile(
              title: Text("Exit"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        title: Text("App Title Here"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print("Tapped");
                    Navigator.pushNamed(context, '/next');
                  },
                  child: Hero(
                    tag: "demo",
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          // shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("images/city.jpeg")),
                          border: Border.all(color: Colors.blue, width: 3),
                          boxShadow: const [BoxShadow(blurRadius: 10)]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  hoverColor: Colors.greenAccent,
                  onTap: () {
                    print("Tapped");
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(colors: [Colors.red, Colors.blue]),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red, width: 3),
                        boxShadow: const [BoxShadow(blurRadius: 10)]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 4),
                        borderRadius: BorderRadius.circular(50),
                        gradient: RadialGradient(colors: const [
                          Colors.yellow,
                          Colors.blue,
                          Colors.red
                        ]))),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 4),
                        borderRadius: BorderRadius.circular(50),
                        gradient: SweepGradient(colors: const [
                          Colors.yellow,
                          Colors.blue,
                          Colors.red
                        ]))),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 200,
                    width: 200,
                    foregroundDecoration: BoxDecoration(
                        backgroundBlendMode: BlendMode.exclusion,
                        gradient: LinearGradient(
                            colors: const [Colors.green, Colors.red])),
                    child: FlutterLogo()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
